# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Fork Information

**Important:** This is a Beacon-maintained fork of ExyteChat.

- **Upstream Repository:** https://github.com/exyte/Chat
- **This Fork:** https://github.com/mgoody55/beacon-ios-chat-ui
- **Beacon Project:** https://github.com/mgoody55/Beacon-CrossPlatform
- **Fork Documentation:** See FORK_NOTICE.md and BEACON_MODIFICATIONS.md

**Key Points:**
- Module name remains `ExyteChat` for compatibility
- Minimal modifications to maintain upstream sync capability
- Beacon-specific features developed in feature branches
- See BEACON_MODIFICATIONS.md for all customizations

## Project Overview

This is **ExyteChat** (beacon-ios-chat-ui), a SwiftUI Chat UI framework with fully customizable message cells and a built-in media picker. It's distributed as a Swift Package Manager library and includes two example applications.

**Original Work:** Created by Exyte (https://github.com/exyte)
**Beacon Customizations:** Tailored for P2P secure messaging with encryption indicators, transport quality display, and offline-first handling.

**Platform Requirements:**
- iOS 17+
- Xcode 15+
- Swift 5.9+

## Build Commands

### Build the library
```bash
swift build
```

### Run tests
```bash
swift test
```

### Build with Xcode
```bash
# Open the package in Xcode
open Package.swift

# Or use xcodebuild
xcodebuild -scheme Chat -destination 'platform=iOS Simulator,name=iPhone 15' build
```

### Build example projects
```bash
# ChatExample (simple bot example with no backend)
open ChatExample/ChatExample.xcodeproj

# ChatFirestoreExample (Firebase integration example)
open ChatFirestoreExample/ChatFirestoreExample.xcodeproj
```

### Code formatting
The project uses `.swift-format` with 4-space indentation. Format code with:
```bash
swift-format -i <file.swift>
```

## Architecture

### Core Structure

The framework follows an MVVM architecture with SwiftUI views:

**Main Components:**
- `ChatView` - The primary view that displays messages and handles user input. Supports two chat types:
  - `conversation` - Latest message at bottom (standard chat)
  - `comments` - Latest message at top (comments/feed style)
- `ChatViewModel` - Manages state for fullscreen attachments, message menu display, and coordinates between input and message sending
- `InputView` + `InputViewModel` - Handles text input, attachments, and user actions (send, photo, audio, giphy)
- `MessageView` - Renders individual messages with customizable content

### Key Models

**Message Flow:**
1. User creates message → `DraftMessage` (contains text, media, recording, giphy, replyMessage)
2. App sends via `didSendMessage` closure → Backend processes
3. Backend returns → `Message` (adds id, user, status, createdAt, reactions)

**Core Models (in `Sources/ExyteChat/Model/`):**
- `Message` - Complete message with id, user, status, text, attachments, reactions, recording, replyMessage
- `DraftMessage` - Outgoing message before backend processing
- `Attachment` - Media attachments with upload status tracking (supports large file uploads >100MB)
- `User` - User info with avatar, name, isCurrentUser flag
- `Reaction` - Message reactions with user and emoji
- `ReplyMessage` - Quoted/replied-to message context

**Attachment Upload Status:**
Messages support real-time upload progress tracking via `Attachment.UploadStatus`:
- `nil` - No progress indicator (default, for pre-uploaded attachments)
- `.inProgress(nil)` - Generic progress spinner
- `.inProgress(percentage)` - Progress with percentage (0-100)
- `.complete` - Upload finished
- `.cancelled` - User cancelled
- `.error` - Upload failed

### Directory Structure

```
Sources/ExyteChat/
├── Views/
│   ├── ChatView.swift - Main chat container
│   ├── ChatViewModel.swift - Chat state management
│   ├── MessageView/ - Message cell components
│   ├── InputView/ - Text input and attachment controls
│   ├── Attachments/ - Media display and fullscreen viewer
│   ├── Recording/ - Audio recording UI
│   └── Giphy/ - Giphy/sticker picker integration
├── Model/ - Data structures (Message, User, Attachment, etc.)
├── Extensions/ - SwiftUI extensions and utilities
├── Managers/ - Focus, keyboard, pagination state
└── Theme/ - ChatTheme for customization

ChatExample/ - Simple bot example (no backend)
ChatFirestoreExample/ - Full Firebase backend integration
Tests/ExyteChatTests/ - Unit tests
```

### Customization Architecture

The framework is highly customizable through builder closures:

**1. Message Builder:**
```swift
ChatView(messages: messages) { draft in
    // send
} messageBuilder: { message, positionInGroup, positionInSection, commentsPosition, showMenu, messageAction, showAttachment in
    // Custom message view
}
```

**2. Input View Builder:**
```swift
.inputViewBuilder { text, attachments, state, style, action, dismissKeyboard in
    // Custom input view
}
```

**3. Message Menu Actions:**
Create custom enum conforming to `MessageMenuAction`, implement menu handlers via `messageMenuAction` closure.

**4. Swipe Actions:**
```swift
.swipeActions(edge: .leading, items: [
    SwipeAction(action: handler, background: .blue) { /* view */ }
])
```

**5. Theme Customization:**
```swift
.chatTheme(ChatTheme(colors: .init(...), images: .init(...)))
```

### Key Architectural Patterns

**State Management:**
- `ChatViewModel` manages fullscreen media, message menus, and message frame for reactions
- `InputViewModel` manages input text, attachments, recording state, edit mode
- `GlobalFocusState` coordinates keyboard focus across views
- `PaginationState` handles load-more functionality

**Attachment Handling:**
- Upload status updates flow through `didUpdateAttachmentStatus` closure
- Supports multiple large files with progress tracking
- Kingfisher for image caching with custom cache keys
- `AttachmentUploadUpdate` communicates status changes between sender/receiver

**Message Grouping:**
Messages are organized into sections and groups:
- `MessagesSection` - Groups messages by day with date headers
- `MessageRow` - Individual message or comment thread
- Position tracking: `PositionInUserGroup`, `PositionInMessagesSection`, `CommentsPosition`

**Reply Modes:**
- `.quote` - Reply appears as newest message, quotes original
- `.answer` - Reply appears directly below original message

## Dependencies

Managed via Swift Package Manager:
- `ExyteMediaPicker` (3.2.4+) - Photo/video picker
- `ActivityIndicatorView` (1.0.0+) - Loading indicators
- `GiphyUISDK` (2.2.16+) - Giphy/sticker integration
- `Kingfisher` (8.5.0+) - Image caching

## Code Style

- 4-space indentation (enforced by `.swift-format`)
- SwiftUI with `@MainActor` for view models
- Sendable conformance for models (strict concurrency enabled)
- Extensive use of closures for customization points
- Public API uses clear, descriptive builder pattern

## Testing

Tests are located in `Tests/ExyteChatTests/`:
- `ExampleChatTests.swift` - Basic chat functionality
- `LinkMetadataCacheTest.swift` - Link preview caching
- `WrappingMessagesTest.swift` - Message layout tests

Run tests targeting iOS simulator:
```bash
xcodebuild test -scheme Chat -destination 'platform=iOS Simulator,name=iPhone 15'
```

## Important Implementation Notes

**Working with Messages:**
- Always pass `Message` objects to ChatView, receive `DraftMessage` from send closure
- Message IDs must be unique and stable across app restarts
- Use `triggerRedraw` UUID to force re-render when updating existing messages

**Attachment Uploads:**
- For production apps, implement Option 3 (percentage-based progress) for best UX
- Synchronize upload status between sender/receiver via WebSocket/backend
- Handle `.cancelled` and `.error` states appropriately

**MediaPicker Configuration:**
```swift
.setMediaPickerParameters(MediaPickerParameters(...))
.assetsPickerLimit(10) // Or use setMediaPickerSelectionParameters for more control
```

**Giphy Integration:**
Requires API key from developers.giphy.com:
```swift
.setAvailableInputs([.text, .giphy])
.giphyConfig(GiphyConfiguration(giphyKey: "key", ...))
```

**Network Status:**
```swift
.showNetworkConnectionProblem(true)
```

**Pagination:**
```swift
.enableLoadMore(pageSize: 20) { message in
    await loadMoreMessages(before: message)
}
```

## Common Development Tasks

**Adding a new message type:**
1. Extend `Message` struct with new property
2. Update `DraftMessage` if needed for send flow
3. Add UI rendering in `MessageView` or custom message builder
4. Handle in example apps

**Customizing appearance:**
1. Use `.chatTheme()` modifier for colors/images
2. Or implement full custom `messageBuilder` for complete control
3. Customize input view via `inputViewBuilder`

**Testing new features:**
- Use `ChatExample` for quick iteration without backend
- Use `ChatFirestoreExample` for full backend integration testing
