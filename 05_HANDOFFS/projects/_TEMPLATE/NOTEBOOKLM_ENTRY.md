# NotebookLM Entry — <SLUG>

**Notebook name:** `CT-<SLUG>-Architect`  
**Profile:** A (per-slug Architect) — see `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md`

## Upload checklist (this project)

- [ ] `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md`
- [ ] `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md`
- [ ] `README_CONTROL_TOWER.md`
- [ ] `04_GLOBAL_RULES/CONTROL_TOWER-OPERATIONAL-PROTOCOL.md`
- [ ] `06_PROJECT_INDEX/PROJECT_INDEX.md`
- [ ] `05_HANDOFFS/projects/<SLUG>/planning/INTAKE.md` (this folder)
- [ ] `references/client-docs/` (add project materials)
- [ ] `CLOUD_AI_ENTRY.md` (this folder, if present)

## Studio prompts to run (in order)

1. **Prompt A** — Architect Pack 001 → save six files under `planning/` and `AGENTS.md`
2. **Prompt B** — System diagram → merge into `planning/sprints/001-discovery-architecture/blueprint.md`
3. Optional **Prompt D** — Audio briefing for operator

## Save targets

| Output | Path |
|--------|------|
| STATE, DOMAIN, FILE_INVENTORY | `planning/` |
| blueprint, acceptance | `planning/sprints/001-discovery-architecture/` |
| AGENTS | `AGENTS.md` (handoff root) |

## Gate before Cursor

```bash
shipyard refurbish <SLUG>
shipyard sync <SLUG>
```

Then operator: `~/CONTROL TOWER/09_SYNCHRONIZATION/sync_control_tower.sh --apply`

## Escaleta (cross-project)

Use notebook `CT-Orchestration-Escaleta` and `02_ESCALETA_TEMPLATES/NOTEBOOKLM-ESCALETA-PROMPT.md` — not this file.
