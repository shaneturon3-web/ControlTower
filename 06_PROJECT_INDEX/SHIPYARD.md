# SHIPYARD — Phase-2 Orchestration

## Role

ShipYard is the CONTROL TOWER **project factory** and **continuity gate** between Cloud AI (Architect) and Cursor (Builder).

| Zone | Path | Purpose |
|------|------|---------|
| Transport | `~/mnt/gdrive/CONTROL TOWER/` | Drive-synced evidence |
| Semantic | `~/CONTROL TOWER/05_HANDOFFS/projects/<SLUG>/` | Architect packet (Cloud AI reads) |
| Execution | `~/Projects/<date>-slug/` | Builder workspace (local) |
| CLI | `~/ShipYard/` | `shipyard` commands |

## Commands

```bash
cd ~/ShipYard && source .venv/bin/activate
shipyard list
shipyard new "Project Name"
shipyard refurbish <SLUG>
shipyard sync <SLUG>          # validates + dry-run; operator runs --apply
shipyard register --all       # backfill existing ~/Projects folders
```

## Workflow

1. **Research** — `shipyard new` seeds handoff + execution trees.
2. **Architectural** — Gemini/ChatGPT edit `05_HANDOFFS/projects/<SLUG>/` (see `CLOUD_AI_ENTRY.md`).
3. **Gate** — `shipyard refurbish <SLUG>` must exit 0.
4. **Sync** — `shipyard sync <SLUG>` then operator: `~/CONTROL TOWER/09_SYNCHRONIZATION/sync_control_tower.sh --apply`.
5. **Engineering** — Cursor builds at path in `EXECUTION_POINTER.md`.

## References

- Operator guide: `~/ShipYard/Instructions.md`
- Cloud AI entry: `04_GLOBAL_RULES/README-CLOUD-AI.md`
- GitHub (optional): `04_GLOBAL_RULES/README-GITHUB.md`
