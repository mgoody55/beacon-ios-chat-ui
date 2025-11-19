# Contributing to Beacon iOS Chat UI

## Fork Notice

**Important:** This is a Beacon-maintained fork of ExyteChat.

- **This Fork:** https://github.com/mgoody55/beacon-ios-chat-ui
- **Upstream Repository:** https://github.com/exyte/Chat
- **Beacon Project:** https://github.com/mgoody55/Beacon-CrossPlatform

### Contributing to This Fork

If you're contributing Beacon-specific features:

1. **Open an Issue** in the Beacon-CrossPlatform repository first
2. **Create a Feature Branch** from `main` with descriptive name (e.g., `feature/security-indicators`)
3. **Document Changes** in BEACON_MODIFICATIONS.md BEFORE implementation
4. **Follow Code Style** guidelines below
5. **Test with Beacon App** thoroughly before submitting PR
6. **Submit Pull Request** with clear description of changes and rationale

### Contributing to Upstream

If you're fixing bugs or adding features that benefit the broader ExyteChat community:

1. **Consider Contributing Upstream** - Submit PRs to https://github.com/exyte/Chat
2. We'll then sync those changes back to this fork
3. This helps both projects and maintains better compatibility

### Development Workflow

**For Beacon-Specific Features:**
- Branch from `main`
- Keep changes minimal and focused
- Use composition over modification where possible
- Update BEACON_MODIFICATIONS.md
- Tag releases with clear version numbers

**For Bug Fixes:**
- Consider if the bug exists upstream
- If yes, submit fix to upstream first
- Cherry-pick or merge upstream fix to this fork

## Code Style

Please use selected code formatting style:
- 4 spaces tab
- no spaces on empty lines
- comment: "// start with small letter"
- declaration: "var users: [User]"

### swift-format

You can use [swift-format](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjol7H-_6iLAxW5ZmwGHViJIX8QFnoECBoQAQ&url=https%3A%2F%2Fgithub.com%2Fswiftlang%2Fswift-format&usg=AOvVaw0kMi_vMj0IW_Vm5BZ8ffcT&opi=89978449) to do this

Code style is specified in .swift-format
Run swift-format before checkin to ensure matching code style

```bash
#example swift format command
swift-format format -i --configuration .swift-format Sources/ExyteChat/ChatView/ChatView.swift
```




