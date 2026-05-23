# File Inventory — ShipYard Web

## Cloudflare-native (`~/ShipYard/web/`)

| Path | Role |
|------|------|
| `wrangler.jsonc` | Worker, Pages assets, D1, R2 bindings |
| `package.json` | npm scripts, wrangler dev/deploy |
| `schema/001_init.sql` | D1 tables: `projects`, `ai_audit_feedback` |
| `src/worker.ts` | API routes: `/api/projects`, `/api/projects/:slug`, `/api/new`, `/api/audit/:slug` |
| `src/types.ts` | Shared types |
| `public/index.html` | Dashboard (Tailwind + HTMX) |
| `public/app.js` | Client helpers |
| `scripts/seed-d1.sql` | Seed from PROJECT_INDEX slugs |

## CONTROL TOWER (semantic)

| Path | Role |
|------|------|
| `06_PROJECT_INDEX/PROJECT_INDEX.md` | Human-readable index (CLI source) |
| `06_PROJECT_INDEX/PROJECT_INDEX.json` | Web/D1 mirror export |
| `05_HANDOFFS/projects/<SLUG>/` | Architect packets |
| `10_ORCHESTRATION/SHIPYARD.md` | Operator docs |

## Local CLI (unchanged)

| Path | Role |
|------|------|
| `~/ShipYard/shipyard/cli.py` | Typer CLI |
| `~/ShipYard/shipyard/project_index.py` | Index parser |

## GitHub

| Repo | Role |
|------|------|
| `shaneturon3-web/ControlTower` | Orchestration docs, NOTEBOOKLM.md |
| `shaneturon3-web/PsyNova` | Product codebase (separate) |
