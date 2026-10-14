import Cocoa

final class KeyablePanel: NSPanel {
    static let minFreeSize = NSSize(width: 160, height: 48)
    static let dragThreshold: CGFloat = 3

    var supportsFreePlacement = false
    var onFreePlacementBegan: (() -> Void)?
    var onFreePlacementResized: ((NSRect) -> Void)?
    var onFreePlacementEnded: ((NSRect?) -> Void)?

    override var canBecomeKey: Bool { true }
    override var canBecomeMain: Bool { false }

    override func sendEvent(_ event: NSEvent) {
        guard supportsFreePlacement, event.type == .leftMouseDown,
            event.modifierFlags.contains(.command)
        else {
            super.sendEvent(event)
            return
        }
        track(resizing: event.modifierFlags.contains(.option))
    }

    private func track(resizing: Bool) {
        let startFrame = frame
        let startPoint = NSEvent.mouseLocation
        var moved = false
        onFreePlacementBegan?()

        while let next = NSApp.nextEvent(
            matching: [.leftMouseDragged, .leftMouseUp], until: .distantFuture,
            inMode: .eventTracking, dequeue: true), next.type != .leftMouseUp
        {
            let point = NSEvent.mouseLocation
            let dx = point.x - startPoint.x
            let dy = point.y - startPoint.y
            if !moved, abs(dx) < Self.dragThreshold, abs(dy) < Self.dragThreshold { continue }
            moved = true

            guard resizing else {
                setFrameOrigin(
                    NSPoint(x: startFrame.minX + dx, y: startFrame.minY + dy))
                continue
            }

            var target = startFrame
            target.size.width = max(Self.minFreeSize.width, startFrame.width + dx)
            target.size.height = max(Self.minFreeSize.height, startFrame.height - dy)
            target.origin.y = startFrame.maxY - target.height
            setFrame(target, display: true)
            onFreePlacementResized?(target)
        }

        onFreePlacementEnded?(moved ? frame : nil)
    }
}
