# ShipYard — CONTROL TOWER Phase-2 Orchestration

**Repository:** `~/ShipYard`  
**Index:** `06_PROJECT_INDEX/SHIPYARD.md`

## Install

```bash
cd ~/ShipYard
./setup-shipyard.sh   # once per machine
source .venv/bin/activate
shipyard --help
```

## Commands

| Command | Purpose |
|---------|---------|
| `shipyard list` | Projects from `06_PROJECT_INDEX/PROJECT_INDEX.md` |
| `shipyard new "Name"` | `~/Projects/<date>-slug/` + `05_HANDOFFS/projects/<SLUG>/` |
| `shipyard register --all` | Backfill existing `~/Projects/*` |
| `shipyard refurbish <SLUG>` | Continuity gate (exit 1 if gaps) |
| `shipyard sync <SLUG>` | Validate + `sync_control_tower.sh --dry-run`; print `--apply` |

## Migration (one-time)

```bash
shipyard register --all
shipyard refurbish SHIPYARD
shipyard sync SHIPYARD
# then operator:
~/CONTROL\ TOWER/09_SYNCHRONIZATION/sync_control_tower.sh --apply
```

## Three zones

| Zone | Path |
|------|------|
| Transport | `~/mnt/gdrive/CONTROL TOWER/` |
| Semantic (Architect) | `~/CONTROL TOWER/05_HANDOFFS/projects/<SLUG>/` |
| Execution (Builder) | `~/Projects/` (per `EXECUTION_POINTER.md`) |

## ShipYard Web (Cloudflare)

**Execution:** `~/ShipYard/web/`  
**Docs:** `05_HANDOFFS/projects/SHIPYARD/planning/sprints/001-discovery-architecture/`

```bash
cd ~/ShipYard/web && npm install && npm run db:local && npm run dev
```

| Phase | Scope |
|-------|--------|
| 1 MVP | Read-only dashboard + D1 seed (`GET /api/projects`) |
| 2 | `POST /api/new` → local `shipyard new` bridge |
| 3 | R2 planning snapshots + `GET /api/audit/:slug` |
| 4 | Refurbish/sync status on dashboard |

## NotebookLM (Architect synthesis)

- Manual: `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md`
- Per-slug: `05_HANDOFFS/projects/<SLUG>/NOTEBOOKLM_ENTRY.md`
