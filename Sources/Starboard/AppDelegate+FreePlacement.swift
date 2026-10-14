import Cocoa

extension AppDelegate {
    var isFreelyPlaced: Bool { PanelSettings.freeFrame != nil }

    func installFreePlacementHandlers() {
        panel.supportsFreePlacement = true

        panel.onFreePlacementBegan = { [weak self] in
            self?.isRepositioning = true
        }

        panel.onFreePlacementResized = { [weak self] frame in
            self?.layOutPanelContents(for: frame.size)
        }

        panel.onFreePlacementEnded = { [weak self] frame in
            guard let self else { return }
            self.isRepositioning = false
            guard let frame else { return }
            self.isExpanded = false
            self.expansionScreenID = nil
            self.isFrozen = false
            PanelSettings.freeFrame = frame
            self.collapsedFrame = frame
            self.layOutPanelContents(for: frame.size)
            self.updateFallbackHintVisibility()
            self.debugLog("placement", "pinned at \(frame)")
        }
    }

    func layOutPanelContents(for size: NSSize) {
        terminalView.frame = TerminalLayout.contentFrame(
            in: NSRect(origin: .zero, size: size), font: terminalView.font)
        positionFallbackHint()
    }

    @objc func snapBackToDock(_ sender: Any?) {
        guard isFreelyPlaced else { return }
        PanelSettings.freeFrame = nil
        isExpanded = false
        expansionScreenID = nil
        isFrozen = false

        refreshCoarseCaches()
        let presence = resolveDockPresence()
        lastPresenceUntracked = presence?.isUntracked ?? true
        let target =
            presence.map { collapsedGeometry(for: $0) }
            ?? NSRect(x: 0, y: 0, width: Self.fallbackWidth, height: Self.fallbackHeight)

        if !panel.isVisible { panel.orderFrontRegardless() }
        applyFrame(target, animated: true)
        updateFallbackHintVisibility()
        debugLog("placement", "snapped back to \(target)")
    }
}
