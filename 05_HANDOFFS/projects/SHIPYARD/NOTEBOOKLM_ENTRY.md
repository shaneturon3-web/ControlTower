# NotebookLM Entry — SHIPYARD

**Notebook name:** `CT-SHIPYARD-Architect`  
**Profile:** A (per-slug Architect) — see `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md`

## Upload checklist (this project)

- [ ] `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md`
- [ ] `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md`
- [ ] `README_CONTROL_TOWER.md`
- [ ] `04_GLOBAL_RULES/CONTROL_TOWER-OPERATIONAL-PROTOCOL.md`
- [ ] `06_PROJECT_INDEX/PROJECT_INDEX.md`
- [ ] `06_PROJECT_INDEX/SHIPYARD.md`
- [ ] `10_ORCHESTRATION/SHIPYARD.md`
- [ ] `05_HANDOFFS/projects/SHIPYARD/planning/INTAKE.md` (this folder)
- [ ] `~/ShipYard/Instructions.md` (export from execution repo as reference)

## Studio prompts to run (in order)

1. **Prompt A** — Architect Pack 001
2. **Prompt B** — System diagram (ShipYard + CONTROL TOWER zones)
3. Optional **Prompt D** — Audio briefing

## Save targets

| Output | Path |
|--------|------|
| STATE, DOMAIN, FILE_INVENTORY | `planning/` |
| blueprint, acceptance | `planning/sprints/001-discovery-architecture/` |
| AGENTS | `AGENTS.md` (handoff root) |

## Gate before Cursor

```bash
shipyard refurbish SHIPYARD
shipyard sync SHIPYARD
```
