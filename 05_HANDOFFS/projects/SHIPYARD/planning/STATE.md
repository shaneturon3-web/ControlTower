# System State — SHIPYARD Web

**Last updated:** 2026-05-23

`OPERATIONAL_PHASE=Architectural`

## Current state

| Area | State |
|------|--------|
| Platform | Local OptiPlex server (operator node) |
| Interface | Python CLI (`Typer` + `Rich`) at `~/ShipYard` |
| Logic | `shipyard/project_index.py`, `shipyard/tools/new_project_scaffold.py` |
| Sync | Manual / operator `rclone`; `shipyard sync` dry-run only |
| Handoffs | `~/CONTROL TOWER/05_HANDOFFS/projects/<SLUG>/` |
| GitHub | Public `shaneturon3-web/ControlTower` — `NOTEBOOKLM.md` |

## Target state (ShipYard Web)

| Area | State |
|------|--------|
| Platform | Cloudflare Pages + Workers + D1 + R2 |
| Interface | Web dashboard (HTML, Tailwind, HTMX) |
| Logic | Worker API; D1 project metadata (mirrors index) |
| Sync | Dashboard handoff-readiness indicators; CLI remains canonical for apply |
| Security | Cloudflare Access (Zero Trust) at edge |

## Integration health

| Integration | Status |
|-------------|--------|
| ShipYard CLI | Active |
| CONTROL TOWER handoffs | Active |
| ShipYard Web (MVP) | Engineering — `~/ShipYard/web/` |
| Cloudflare deploy | Operator: `wrangler deploy` when credentials configured |

## Open questions

- Webhook vs `rclone` for local folder creation after `POST /new`
- R2 snapshot cadence for `planning/` folders
