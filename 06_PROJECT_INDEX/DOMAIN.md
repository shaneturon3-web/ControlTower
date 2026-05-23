# Domain Boundaries

## In scope

- Hardware-agnostic automation under username `shane`
- Cross-machine AI protocol sync via Google Drive (remote `GD`)
- Cursor user rules + Architect-Pack handoff structure

## Out of scope

- Machine-specific script forks
- Syncing `~/.machine_env`, rclone credentials, or tokens
- Modifying Touchégg, CopyQ, or keyboard layout without explicit request

## Canonical paths

| Purpose | Local | Drive |
|---------|-------|-------|
| Architect Pack hub | `~/Architect-Pack/` | `GPTs/Architect-Pack/`, `AIs & System Preferences/` |
| Registry | `~/GPTs/` | `GPTs/` |
| Cursor rules | `~/.cursor/rules/` | `GPTs/cursor/rules/` |
