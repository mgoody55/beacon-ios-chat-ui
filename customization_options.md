# ExyteChat UI Customization Options

This document provides a comprehensive breakdown of all configurable UI elements in the ExyteChat framework for standardizing the visual appearance of your app.

## **1. Colors (ChatTheme.Colors)** - 25 Properties

**Located in:** `Sources/ExyteChat/Theme/ChatTheme.swift:108-228`

### Backgrounds
- `mainBG` - Overall chat background
- `inputBG` - Text input area background
- `inputSignatureBG` - Media caption input background
- `menuBG` - Long-press menu background

### Message Bubbles
- `messageMyBG` - Your messages (default: #4962FF)
- `messageFriendBG` - Incoming messages (default: #EBEDF0)
- `messageSystemBG` - System notifications

### Text Colors
- `mainText` - Primary text
- `mainCaptionText` - Subtitle/caption text
- `messageMyText` - Text in your messages
- `messageFriendText` - Text in incoming messages
- `messageSystemText` - System message text
- `messageMyTimeText` - Your message timestamps
- `messageFriendTimeText` - Incoming message timestamps
- `messageSystemTimeText` - System timestamp text
- `inputText` - Text being typed
- `inputPlaceholderText` - Input placeholder
- `inputSignatureText` - Caption text
- `inputSignaturePlaceholderText` - Caption placeholder
- `menuText` - Menu item labels
- `menuTextDelete` - Destructive actions (red)

### Accents & Status
- `mainTint` - Primary accent color
- `sendButtonBackground` - Send button fill
- `recordDot` - Recording indicator
- `statusError` - Error indicators
- `statusGray` - Inactive states

## **2. Images (ChatTheme.Images)** - 50+ Assets

**Located in:** `Sources/ExyteChat/Theme/ChatTheme.swift:230-471`

All icon assets can be replaced with custom images or SF Symbols. Categories include:
- Navigation (back button, scroll to bottom)
- Attach menu (camera, photo, document, location, contact)
- Input view (add, send, sticker, attach, microphone)
- Fullscreen media (play, pause, mute, unmute)
- Message status (sending, sent, read, error, cancel)
- Message menu (delete, edit, forward, retry, save, select)
- Recording (pause, play, stop, send, delete, lock, cancel)
- Reply actions (reply indicator, cancel reply)
- Background images (portrait/landscape, light/dark modes)

## **3. Layout & Spacing Constants**

**Located in:** `Sources/ExyteChat/Views/MessageView/MessageView.swift:39-47`

### Message Layout
- `widthWithMedia` - 204pt
- `horizontalScreenEdgePadding` - 12pt
- `horizontalNoAvatarPadding` - 6pt
- `horizontalAvatarPadding` - 8pt
- `horizontalTextPadding` - 12pt
- `attachmentPadding` - 1pt
- `statusViewSize` - 10pt
- `horizontalStatusPadding` - 6pt
- `horizontalBubblePadding` - 70pt

### Border Radii
- Message bubble with media: **12pt**
- Message bubble text-only: **20pt**
- Input container: **18pt**
- Attachment grid: **12pt**
- Time capsule: **8pt** (capsule shape)
- Progress capsule: **4pt**

### Vertical Spacing
- Between message groups: **8pt**
- Within message group: **4pt**
- Input container padding: **8pt vertical**, **12pt horizontal**

## **4. Typography**

**Font Sizes** (using SwiftUI text styles):
- Message text: **size 15** (scaled with UIFontMetrics) - customizable via `.setMessageFont()`
- `.caption2` - Reply messages, recording duration, attachment captions, network status
- `.caption` - Message timestamps
- `.footnote` - Input placeholders, reaction counts
- `.body` - Attachment counts
- `.title3` - Reaction emojis, reaction selection
- `.title` - Large reaction display
- `.headline` - Navigation title

## **5. Configurable Modifiers**

**Located in:** `Sources/ExyteChat/Views/ChatView.swift:550-767`

### Visual Customization
- `.chatTheme()` - Apply complete theme
- `.avatarSize(CGFloat)` - Avatar diameter (default: 32pt)
- `.setMessageFont(UIFont)` - Custom message text font
- `.messageMenuAnimationDuration(Double)` - Menu animation speed (0.1-1.0s)

### Style Properties
- `replyOpacity` - Reply message transparency (0.0-1.0, default: 0.8)

## **6. Icon & Component Sizes**

- Avatar: **32pt** (default, configurable)
- Fullscreen media controls: **24pt**
- Attachment play/pause overlay: **36pt**
- Input view buttons: **24pt** standard, **48pt** large
- Scroll to bottom button: **40pt**
- Lock icon: **28pt**
- Record dot: **6pt**
- Video thumbnail play: **26pt**

## **7. Audio Recording Settings**

**Located in:** `Sources/ExyteChat/Views/Recording/Recorder.swift:146-174`

Via `.setRecorderSettings()`:
- `audioFormatID` - Codec (default: AAC)
- `sampleRate` - Hz (default: 12000)
- `numberOfChannels` - Mono/stereo (default: 1)
- `encoderBitRateKey` - Bit rate (default: 128)
- `linearPCMBitDepth` - Bit depth (default: 16)
- PCM format flags

## **8. Theme Application Methods**

```swift
// Full manual control
.chatTheme(ChatTheme(
    colors: ChatTheme.Colors(...),
    images: ChatTheme.Images(...),
    style: ChatTheme.Style(replyOpacity: 0.8)
))

// Simplified
.chatTheme(
    colors: ChatTheme.Colors(...),
    images: ChatTheme.Images(...)
)

// Basic accent color
.chatTheme(accentColor: .blue, images: .init())

// iOS 18+ auto-theming
.chatTheme(
    themeColor: .blue,
    background: .mixedWithAccentColor(byAmount: 0.2),
    improveContrast: true
)
```

---

## **Key Files for Standardization**

- `Sources/ExyteChat/Theme/ChatTheme.swift` - All color, image, and style definitions
- `Sources/ExyteChat/Views/MessageView/MessageView.swift` - Layout constants
- `Sources/ExyteChat/Views/InputView/InputView.swift` - Input UI spacing

This framework allows complete UI standardization through the `ChatTheme` object, covering every visual aspect from colors and fonts to spacing and icons.
