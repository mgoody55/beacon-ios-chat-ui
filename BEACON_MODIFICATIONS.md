# Beacon Modifications Changelog

This document tracks all Beacon-specific customizations and enhancements made to the ExyteChat fork.

## Version History

### Baseline Fork (November 2024)

**Fork Point:** ExyteChat v2.7.4

**Initial Setup:**
- Forked from https://github.com/exyte/Chat
- Created beacon-ios-chat-ui repository
- Established fork documentation infrastructure
- No functional code changes in baseline

**Documentation Added:**
- `FORK_NOTICE.md` - Fork relationship and purpose
- `BEACON_MODIFICATIONS.md` - This file
- Updated `README.md` - Added fork notice and Beacon installation instructions
- Updated `LICENSE` - Added Beacon modifications notice
- Updated `CLAUDE.md` - Added fork-specific developer guidance

**Rationale:** Establish clear fork identity while maintaining full compatibility with upstream ExyteChat.

---

## Planned Modifications

The following modifications are planned for future releases to support Beacon's P2P messaging requirements:

### Security Indicators (Planned)

**Feature:** Display encryption and verification status in chat UI

**Components to Add:**
- Encryption status badge in message cells
- Identity verification indicator in user avatars
- Security warning banners for unverified contacts
- End-to-end encryption confirmation icons

**Integration Points:**
- Custom message builder with security overlay
- ChatTheme extension for security colors
- New `SecurityStatus` model in Message

**Status:** Not yet implemented

### Transport Quality Display (Planned)

**Feature:** Show active transport type and connection quality

**Components to Add:**
- Transport type chips (TCP, LoRa, Multipeer, Waypoint)
- Connection quality indicators (RTT, signal strength)
- Transport switching notifications
- Offline mode indicators

**Integration Points:**
- Custom header view builder
- InputView extension for connection status
- New `TransportStatus` model

**Status:** Not yet implemented

### Offline-First Message Handling (Planned)

**Feature:** Enhanced offline message queueing and sync

**Components to Add:**
- Pending message status tracking
- Automatic retry on reconnection
- Optimistic message delivery UI
- Sync conflict resolution indicators

**Integration Points:**
- Message.Status extension
- Custom message status views
- Background sync coordination

**Status:** Not yet implemented

### Custom Beacon Styling (Planned)

**Feature:** Beacon-specific design language

**Components to Add:**
- Beacon color palette
- Custom fonts and typography
- Beacon-specific icons and assets
- Dark mode optimizations for mesh networking

**Integration Points:**
- Extended ChatTheme
- Custom message cell styling
- Beacon branding elements

**Status:** Not yet implemented

### P2P Attachment Handling (Planned)

**Feature:** Direct peer-to-peer media transfer

**Components to Add:**
- P2P transfer progress tracking
- Chunked transfer support for large files
- Resume capability for interrupted transfers
- Transport-aware attachment routing

**Integration Points:**
- Attachment.UploadStatus extension
- Custom attachment status views
- Direct transfer protocol integration

**Status:** Not yet implemented

---

## Development Guidelines

When adding modifications:

1. **Document First:** Update this file BEFORE implementing changes
2. **Feature Branches:** Develop each feature in a separate branch
3. **Minimal Core Changes:** Keep modifications to library core minimal
4. **Upstream Compatibility:** Maintain ability to merge upstream updates
5. **Testing:** Thoroughly test with Beacon app before merging
6. **Versioning:** Tag releases with clear version numbers

## Modification Categories

### Core Changes
Modifications to the core ExyteChat library (Sources/ExyteChat/)
- Currently: None

### Extension Modules
Additional modules that extend functionality without modifying core
- Currently: None

### Theme Extensions
Custom themes and styling specific to Beacon
- Currently: None

### Model Extensions
Additional models or extensions to existing models
- Currently: None

### View Extensions
Custom views or view builders
- Currently: None

---

## Upstream Sync Log

Track merges and cherry-picks from upstream ExyteChat:

### November 2024
- **Fork created** from v2.7.4
- Baseline established with no code changes
- Documentation infrastructure added

---

## Breaking Changes

List any breaking changes from upstream ExyteChat API:

- Currently: None (full API compatibility maintained)

---

## Notes for Future Maintainers

**Philosophy:** This fork maintains the principle of "upstream first." Before adding a Beacon-specific feature:

1. Consider if it could be contributed upstream
2. Design with upstream compatibility in mind
3. Use composition over modification where possible
4. Document the reasoning for each change

**Module Name:** The module remains `ExyteChat` to maintain API compatibility and simplify upstream syncing. This is intentional and should not be changed.

**Upstream Monitoring:** Check https://github.com/exyte/Chat monthly for:
- Security patches
- Bug fixes
- New features that benefit Beacon
- Breaking changes that require adaptation

**Contact:** For questions about these modifications or the fork strategy, open an issue in the Beacon-CrossPlatform repository.

---

**Last Updated:** November 19, 2024
**Current Version:** 2.7.4 (baseline, no modifications)
**Next Planned Release:** TBD (pending Beacon integration requirements)
