<img src="assets/AppIcon.png" width="96" height="96" alt="Starboard icon" />

# Starboard

[![Latest release](https://img.shields.io/github/v/release/palamim/starboard)](https://github.com/palamim/starboard/releases/latest)

항상 그 자리에 있는 터미널입니다. 불러오지도, 닫지도 않습니다.

Starboard는 macOS Dock 옆에 계속 있습니다. 모든 데스크톱에서 항상 보입니다.
단축키로 불러올 필요가 없습니다. 창을 찾거나, 크기를 바꾸거나, 다른 앱에서
돌아올 필요도 없습니다. 처음부터 사라지지 않기 때문입니다.

이 저장소는 [palamim/starboard](https://github.com/palamim/starboard)의
포크입니다. 원본에 [자유 배치](#자유-배치-이-포크에서-더한-기능) 기능을
더했습니다.

![Starboard demo](assets/demo.gif)

## 기능

- Dock 바로 옆에 있습니다. Dock의 높이와 위치를 실시간으로 따라갑니다.
- 모든 Space와 전체 화면 앱 위에 보입니다. 사용 중인 앱의 포커스를
  가져가지 않습니다.
- 실제 셸(`zsh -l`)이 계속 실행됩니다. `cd`, 명령 기록, 셸 상태가 명령
  사이에 유지됩니다. 명령을 한 번씩 실행하는 도구가 아닙니다.
- 기본 모양은 어두운 배경과 차분한 바다색 ANSI 팔레트입니다.
- 내장 테마가 20개(어두운 테마 10개, 밝은 테마 10개) 있습니다. Gruvbox,
  Solarized, Monokai, One Dark/Light, Tokyo Night, Catppuccin 등이 있습니다.
- 패널을 `⌘`-드래그로 옮기고, `⌘⌥`-드래그로 크기를 바꿀 수 있습니다. 이
  기능은 이 포크에서 더했습니다.

## 단축키

| 키 | 동작 |
|---|---|
| `⌘E` | 화면 높이까지 확장. 다시 누르면 원래 크기 |
| `⌘T` | 테마 선택기 열기 (↑/↓ 선택, Enter 적용, Esc 취소) |
| `⌘=` 또는 `⌘+` | 글꼴 크게 |
| `⌘-` | 글꼴 작게 |
| `⌘0` | 기본 글꼴 크기 |
| `⌘Q` | 종료 |

## 자유 배치 (이 포크에서 더한 기능)

자유 배치를 사용하면, 패널을 Dock에서 떼어 원하는 곳에 둘 수 있습니다.

| 조작 | 결과 |
|---|---|
| `⌘` + 드래그 | 패널 이동 |
| `⌘⌥` + 드래그 | 패널 크기 조절 (왼쪽 위 모서리 고정, 최소 160×48) |
| 드래그 | 텍스트 선택 (원본과 같음) |
| 패널 메뉴 → **Snap Back to Dock** | Dock 옆으로 복귀 |

패널을 옮기거나 크기를 바꾸면, Starboard가 위치와 크기를 저장합니다.
Starboard를 다시 실행해도 패널은 그 자리에 나타납니다.

자유 배치 상태에서는 다음과 같이 동작합니다.

- 패널이 Dock을 따라가지 않습니다. Dock이 자동으로 숨어도 패널은 화면에
  남습니다.
- **Snap Back to Dock** 메뉴 항목이 패널 메뉴에 나타납니다.
- 손쉬운 사용 권한 안내가 나타나지 않습니다. 자유 배치에는 이 권한이 필요하지
  않습니다.
- 모니터 연결이 바뀌어 패널이 어느 화면에도 없으면, Starboard가 패널을 화면
  가운데로 옮깁니다.

`⌘`를 누른 채 클릭만 하면, 패널은 Dock 옆에 그대로 있습니다. 3pt 이상
끌어야 자유 배치가 됩니다. 확장 모드(`⌘E`)에서 드래그하면, 확장 모드가
끝납니다. 패널은 놓은 자리에 드래그 직전 크기로 고정됩니다.

## 패널 메뉴와 설정

패널 오른쪽 아래의 메뉴 버튼을 누르면, 패널 메뉴가 열립니다. 패널 메뉴에는
다음 항목이 있습니다.

- **Expand** 또는 **Collapse**: `⌘E`와 같음
- **Theme: (현재 테마 이름)**: 테마 선택기 열기
- **Settings…**: 설정 패널 열기
- **Snap Back to Dock**: 자유 배치 상태에서만 보임
- **Quit Starboard**: 종료

설정 패널에서 다음 값을 바꿀 수 있습니다. 바꾼 값은 Starboard를 다시 실행해도
유지됩니다.

- **Corner radius**: 패널 모서리의 둥글기
- **Background opacity**: 배경의 불투명도
- **Font**: 설치된 고정폭 글꼴 중 하나
- 글꼴 크기: 9–20pt
- **Extra height above Dock**: Dock 위로 더할 패널 높이
- **Stay visible when Dock hides**: Dock이 자동으로 숨어도 패널 표시

**Reset to Defaults**는 위 값을 기본값으로 되돌립니다. 자유 배치의 위치와
크기는 되돌리지 않습니다.

## 설치

Homebrew와 Releases의 빌드는 원본 저장소의 빌드입니다. 이 빌드에는 자유 배치가
없습니다. 자유 배치를 사용하려면, [소스에서 빌드](#소스에서-빌드) 절을
따르십시오.

### Homebrew

```
brew tap palamim/starboard https://github.com/palamim/starboard
brew install --cask palamim/starboard/starboard
```

tap이 이 저장소 안에 있으므로, `brew tap`에 전체 URL이 필요합니다. 짧은
형식은 이름이 `homebrew-*`인 저장소에서만 동작합니다. 공식 `homebrew/cask`
tap은 공증된 빌드만 받습니다. 그래서 Starboard는 그 tap에 들어갈 수 없습니다.

Homebrew를 사용하면, 내려받기와 `mv`를 직접 하지 않아도 됩니다. `brew
upgrade`가 새 릴리스를 설치합니다. 그러나 아래 처음 실행의 승인 단계는
같습니다. `brew`로 설치한 앱도 Gatekeeper 검사를 받습니다.

### 직접 설치

1. [Releases](https://github.com/palamim/starboard/releases/latest)에서 최신
   `Starboard.zip`을 내려받으십시오.
2. 다음 명령을 실행하십시오.

   ```
   unzip Starboard.zip
   mv Starboard.app /Applications/
   open /Applications/Starboard.app
   ```

### 처음 실행

빌드는 ad-hoc 서명만 되어 있고, 공증되지 않았습니다. 그래서 처음 실행할 때
승인 단계가 더 있습니다. 설치 방법과 관계없이 같습니다.

1. Starboard를 여십시오.
2. macOS가 실행을 막으면, **완료**를 누르십시오.
3. **시스템 설정 → 개인정보 보호 및 보안**을 여십시오.
4. Starboard 항목 옆의 **그래도 열기**를 누르십시오.
5. 확인 창에서 **그래도 열기**를 다시 누르십시오.
6. 암호를 입력하십시오.
7. 손쉬운 사용 권한 요청 창이 나타나면, **시스템 설정 열기**를 누르십시오.
8. **손쉬운 사용** 목록에서 Starboard를 켜십시오.

Starboard는 손쉬운 사용 권한으로 Dock의 위치를 읽습니다.

### 로그인할 때 자동 실행

1. **시스템 설정 → 일반 → 로그인 항목 및 확장 프로그램**을 여십시오.
2. **+**를 누르십시오.
3. `Starboard.app`을 선택하십시오.

위의 두 설치 방법에는 스크립트가 필요하지 않습니다.

### 업데이트한 뒤 Dock을 따라가지 않을 때

같은 `/Applications/Starboard.app`을 덮어쓰면, 손쉬운 사용 권한을 다시 받아야
합니다. 릴리스마다 서명이 다르기 때문입니다. `brew upgrade`도 같은 앱을
덮어씁니다.

macOS가 권한을 다시 요청하지 않을 수 있습니다. 시스템 설정은 권한이 켜져
있다고 보여 주지만, 실제로는 동작하지 않습니다. 같은 확인란을 다시 켜도
해결되지 않습니다.

업데이트한 뒤 Starboard가 Dock을 따라가지 않으면, 다음을 하십시오.

1. 다음 중 하나로 Starboard의 권한을 지우십시오.
   - **시스템 설정 → 개인정보 보호 및 보안 → 손쉬운 사용**에서 Starboard를
     선택하고 **−**를 누르십시오.
   - `tccutil reset Accessibility com.starboard.app`을 실행하십시오.
2. Starboard를 다시 실행하십시오.
3. 권한 요청 창이 나타나면, 권한을 주십시오.

원인은 `CLAUDE.md`에 있습니다. `scripts/install.sh`로 설치한 빌드도 함께
있으면, `CLAUDE.md`의 방법을 따르십시오.

## 소스에서 빌드

자유 배치가 들어간 빌드는 이 방법으로만 얻을 수 있습니다.

```
git clone https://github.com/nonsignal007/starboard
cd starboard
```

한 번 실행:

```
swift build
.build/debug/Starboard
```

로그인할 때 실행(`.app`을 패키징하고 코드 서명한 뒤, LaunchAgent로 등록):

```
scripts/install.sh
```

멈춤, 시작, 제거:

```
launchctl unload ~/Library/LaunchAgents/com.starboard.app.plist   # 멈춤
launchctl load ~/Library/LaunchAgents/com.starboard.app.plist     # 시작
scripts/uninstall.sh                                              # 완전히 제거
```

로그: `~/Library/Logs/Starboard.log`

소스 빌드는 로그인 항목 대신 이 스크립트를 사용합니다. 스크립트를 사용하면,
다시 빌드해도 손쉬운 사용 권한이 유지됩니다. 이유는 `CLAUDE.md`에 있습니다.

## Quake 방식 터미널과 다른 점

Guake, Yakuake, tilda, iTerm2의 hotkey window, Ghostty의 quick terminal은
단축키로 터미널을 불러옵니다. 불러온 터미널에 포커스를 주고, 일이 끝나면 다시
닫습니다.

Starboard에는 단축키가 없습니다. 포커스를 가져가지 않고, 불러오고 닫는 과정도
없습니다. Dock처럼 그 자리에 있을 뿐입니다. 그래서 앱을 바꾸지 않고 지금
프로젝트에서 명령을 실행할 수 있습니다. 실행한 뒤에는 바로 편집기로 돌아갈 수
있습니다.

## 요구 사항

- macOS 13 이상
- 손쉬운 사용 권한 (처음 실행할 때 요청)

Starboard는 손쉬운 사용 권한으로 Dock의 현재 위치를 읽습니다. 권한이 없어도
Starboard는 동작합니다. 다만 Dock 옆이 아니라 고정된 모서리에 있습니다.

## Dock을 따라가는 방식

- Dock을 다른 모니터로 옮기면, Starboard도 1초 안에 그 모니터의 Dock 옆으로
  옮겨 갑니다.
- Dock이 자동으로 숨으면, Starboard도 함께 숨고 나타납니다.
- 패널에 입력하는 중이거나 확장 모드이면, Starboard는 숨지 않습니다. 그래서
  입력 도중에 패널이 사라지지 않습니다.
- **Stay visible when Dock hides**를 켜면, Dock이 숨어도 패널이 보입니다.
- Dock이 왼쪽이나 오른쪽에 있으면, Starboard는 Dock 옆에 붙지 않습니다. 대신
  Dock이 있는 화면의 고정된 모서리에 있습니다. 이때 `⌘`-드래그로 패널을
  원하는 곳에 둘 수 있습니다.

감지 방식의 자세한 내용은 `CLAUDE.md`에 있습니다.

## 보안과 신뢰

Starboard는 네트워크 요청을 하지 않고, 데이터를 모으지 않습니다. 소스에 그런
코드가 없습니다. 소스는 Swift 파일 25개, 약 2,600줄입니다. 그래서 직접 읽고
확인할 수 있습니다.

민감해 보이는 권한은 손쉬운 사용 하나입니다. Starboard는 이 권한을 한 곳에만
사용합니다. Dock의 화면 위치를 읽어 패널을 그 옆에 둘 때입니다.

## 알려진 문제

- 붙여 넣은 텍스트가 다음 키 입력 전까지 잠깐 다른 색으로 보입니다.
- (이전 문제) 화면을 다시 그릴 때 일부 프롬프트 글리프가 `?`로 보였습니다.
  최근에는 다시 나타나지 않았습니다.

두 문제의 자세한 내용, 구조, 설계 결정은 `CLAUDE.md`에 있습니다.

## 라이선스

MIT. 자세한 내용은 `LICENSE`에 있습니다.
