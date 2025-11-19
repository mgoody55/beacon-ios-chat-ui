# Fork Notice

This repository is a fork of [ExyteChat](https://github.com/exyte/Chat) by [Exyte](https://exyte.com/).

## Purpose

This fork is maintained for the [Beacon](https://github.com/mgoody55/Beacon-CrossPlatform) project to provide a customizable chat UI framework for secure peer-to-peer messaging. Beacon is a cross-platform P2P messaging application with mandatory end-to-end encryption across local networks, internet relay, and mesh networks.

## Upstream Relationship

- **Upstream Repository:** https://github.com/exyte/Chat
- **Fork Repository:** https://github.com/mgoody55/beacon-ios-chat-ui
- **Fork Point:** Version 2.7.4
- **Fork Date:** November 2024

## Fork Strategy

We follow a conservative fork strategy to balance customization needs with upstream compatibility:

1. **Track Upstream:** We regularly monitor the upstream repository for bug fixes, security patches, and new features
2. **Minimal Modifications:** Keep core changes minimal to simplify merging upstream updates
3. **Feature Branches:** Develop Beacon-specific features in separate branches
4. **Documentation:** All modifications are documented in BEACON_MODIFICATIONS.md

## Sync Policy

- **Regular Reviews:** Check upstream repository monthly for important updates
- **Security Patches:** Apply security fixes from upstream as soon as available
- **Feature Updates:** Evaluate new upstream features for compatibility with Beacon's needs
- **Selective Merging:** Merge upstream changes that don't conflict with Beacon customizations

## Why Fork?

Beacon requires specific customizations for:

1. **Security Indicators:** Display encryption status, verification state, and security warnings
2. **Transport Quality:** Show connection quality and active transport types (TCP, LoRa mesh, etc.)
3. **Offline-First:** Enhanced offline message handling for P2P networks
4. **Custom Styling:** Beacon-specific design language and branding
5. **P2P Attachments:** Specialized handling for direct peer-to-peer media transfer

While these features are specific to Beacon's architecture, we maintain the module name `ExyteChat` for API compatibility and easier upstream integration.

## Credits

**Original Work:** This library was created by the talented team at [Exyte](https://exyte.com/). All core functionality, architecture, and design patterns are credited to them.

**Copyright:** See LICENSE file for copyright information. Original work is © 2019 Exyte.

**Beacon Modifications:** Customizations for Beacon are © 2024 Beacon Contributors and distributed under the same MIT License.

## Module Name

The module remains `ExyteChat` rather than being renamed to `BeaconChat` for several reasons:

1. **Industry Standard:** Common practice for library forks to maintain the original module name
2. **API Compatibility:** Simplifies switching between upstream and fork
3. **Upstream Integration:** Easier to merge bug fixes and improvements from original repository
4. **Zero Breaking Changes:** Allows drop-in replacement without code changes

The repository name and documentation make the fork relationship clear without requiring a module rename.

## Modifications

See [BEACON_MODIFICATIONS.md](BEACON_MODIFICATIONS.md) for a detailed changelog of all Beacon-specific customizations.

## Contributing

For contributions to this fork, please see [CONTRIBUTING.md](CONTRIBUTING.md). For contributions to the upstream ExyteChat library, please visit the [original repository](https://github.com/exyte/Chat).

## License

This fork maintains the same MIT License as the original ExyteChat library. See [LICENSE](LICENSE) for full details.

---

**Upstream:** https://github.com/exyte/Chat
**This Fork:** https://github.com/mgoody55/beacon-ios-chat-ui
**Beacon Project:** https://github.com/mgoody55/Beacon-CrossPlatform
