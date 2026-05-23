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

## NotebookLM (Architect synthesis)

- Manual: `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md`
- Per-slug: `05_HANDOFFS/projects/<SLUG>/NOTEBOOKLM_ENTRY.md`
