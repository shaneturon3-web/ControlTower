# Cloud AI — Architect Entry (CONTROL TOWER)

You are operating as **Architect** (Research or Architectural phase only). Do not generate production code.

## Read order

1. `README_CONTROL_TOWER.md`
2. `04_GLOBAL_RULES/CONTROL_TOWER-OPERATIONAL-PROTOCOL.md`
3. `06_PROJECT_INDEX/PROJECT_INDEX.md` — pick slug
4. `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md` — if using NotebookLM
5. `05_HANDOFFS/projects/<SLUG>/NOTEBOOKLM_ENTRY.md` — per-slug NotebookLM checklist
6. `05_HANDOFFS/projects/<SLUG>/CLOUD_AI_ENTRY.md` — project-specific discipline
7. `05_HANDOFFS/projects/<SLUG>/planning/INTAKE.md` and existing planning files

## Phase lock

- Read `OPERATIONAL_PHASE=` in `05_HANDOFFS/projects/<SLUG>/planning/STATE.md`.
- Stay in Research/Architectural until a human sets `OPERATIONAL_PHASE=Engineering`.
- Builder work happens in the path named in `EXECUTION_POINTER.md` (Cursor), not in chat.

## Forbidden

- No code generation in Architect phase
- No reading or copying `~/.machine_env`, `rclone.conf`, tokens, or API keys
- No treating one project folder as the root of all projects (non-root rule)

## Tool routing

See `04_GLOBAL_RULES/sugar-cubes/SC-PROTOCOL-005-Tool-Routing-Map.md`:

- **NotebookLM** — multi-source synthesis → Architect Pack 001 + Escaleta (upload manifest first)
- **Gemini / ChatGPT** — strategy, decomposition, Architect Pack refinement
- **Cursor** — Engineering execution only after handoff approval
- **Human (Shane)** — phase declaration, sync apply, final authority

## ShipYard (operator CLI)

Humans run on local nodes; Cloud AI does **not** execute ShipYard:

```bash
shipyard refurbish <SLUG>   # must pass before automated chains
shipyard sync <SLUG>        # validates mount; dry-run only; human runs --apply
```

Operator apply after sync validation:

```bash
~/CONTROL TOWER/09_SYNCHRONIZATION/sync_control_tower.sh --apply
# or mount-first: ~/bin/control-tower-sync.sh --apply
```

## Architect Pack 001 deliverables

Write into `05_HANDOFFS/projects/<SLUG>/planning/`:

- `STATE.md`, `DOMAIN.md`, `FILE_INVENTORY.md`
- `sprints/001-discovery-architecture/blueprint.md`
- `sprints/001-discovery-architecture/acceptance.md`
- `AGENTS.md` when agents are assigned

## Sync source of truth

Google Drive folder **CONTROL TOWER** via `~/mnt/gdrive/CONTROL TOWER/` on operator machines.

## NotebookLM

- Specification: `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md`
- Source upload list: `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md`
- Registry pointer: `00_AGENT_REGISTRY/cloud-ai/README-NOTEBOOKLM.md`

## See also

- `10_ORCHESTRATION/SHIPYARD.md`
- `04_GLOBAL_RULES/README-GITHUB.md` (optional code mirror)
