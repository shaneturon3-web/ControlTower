# Domain — ShipYard Web

## In scope

### Project entity

| Property | Description |
|----------|-------------|
| Slug | Indexed identifier (e.g. `PSYNOVA`, `SHIPYARD`) |
| Status | Active / Archived / Pending scaffold |
| Phase | Research / Architectural / Engineering |
| Sync state | unknown / validated / dry-run-ok |
| Handoff ready | Derived from required planning files |
| Last modified | ISO timestamp |

Maps to `05_HANDOFFS/projects/<SLUG>/` on CONTROL TOWER.

### AI audit feedback

| Property | Description |
|----------|-------------|
| project_slug | FK to project |
| agent_type | NotebookLM, Gemini, ChatGPT, Cursor, etc. |
| suggestion | Text feedback |
| created_at | Timestamp |

### Storage

| Store | Use |
|-------|-----|
| D1 | Project index, audit log, status history |
| R2 | Cached `planning/` snapshots for AI read API |

## Out of scope (explicit)

- Direct terminal execution on OptiPlex via web UI
- Multi-tenant user management beyond Cloudflare Access
- Replacing local CLI — web app must stay compatible with `shipyard` workflows
- Auto-running `sync_control_tower.sh --apply` from the web UI

## Entities

- **Project** — metadata row in D1
- **AuditFeedback** — optional AI suggestions
- **HandoffPacket** — files on Drive / local tower (not stored in D1 content, only flags)
