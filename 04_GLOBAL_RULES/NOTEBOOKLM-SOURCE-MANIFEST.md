# NotebookLM Source Manifest

Upload sources from **`~/CONTROL TOWER`** or the synced Drive folder **`CONTROL TOWER/`** (same content). Upload **in order** — earlier files set context for later ones.

**Limits:** Keep each notebook to **50 sources or fewer**. Prefer PDF/markdown; split large folders into highest-value files first.

---

## Profile A — Per-slug Architect notebook

**Notebook name:** `CT-<SLUG>-Architect`  
**Example:** `CT-PSYNOVA-Architect`

| # | Source path (relative to CONTROL TOWER root) | Required |
|---|-----------------------------------------------|----------|
| 1 | `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md` | Yes |
| 2 | `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md` | Yes |
| 3 | `README_CONTROL_TOWER.md` | Yes |
| 4 | `04_GLOBAL_RULES/CONTROL_TOWER-OPERATIONAL-PROTOCOL.md` | Yes |
| 5 | `06_PROJECT_INDEX/PROJECT_INDEX.md` | Yes |
| 6 | `05_HANDOFFS/projects/<SLUG>/planning/INTAKE.md` | Yes |
| 7 | `05_HANDOFFS/projects/<SLUG>/NOTEBOOKLM_ENTRY.md` | If present |
| 8 | `05_HANDOFFS/projects/<SLUG>/CLOUD_AI_ENTRY.md` | If present |
| 9 | `05_HANDOFFS/projects/<SLUG>/planning/STATE.md` | If any content |
| 10 | `05_HANDOFFS/projects/<SLUG>/planning/DOMAIN.md` | If any content |
| 11+ | `05_HANDOFFS/projects/<SLUG>/references/client-docs/*` | As available |
| 12+ | `05_HANDOFFS/projects/<SLUG>/references/source-app/*` | As available |
| opt | `06_PROJECT_INDEX/SHIPYARD.md` | Only if slug is SHIPYARD |
| opt | `10_ORCHESTRATION/SHIPYARD.md` | If integration context needed |

**Do not upload:** `07_LOGS/` mirrors, `08_BACKUPS/`, `.env`, rclone config, entire `07_LOGS` duplicate tree.

**After upload:** Run Prompt A then Prompt B from `NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md` Section 5.

---

## Profile B — Escaleta / cross-project notebook

**Notebook name:** `CT-Orchestration-Escaleta`

| # | Source path | Required |
|---|-------------|----------|
| 1 | `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md` | Yes |
| 2 | `02_ESCALETA_TEMPLATES/NOTEBOOKLM-ESCALETA-PROMPT.md` | Yes |
| 3 | `02_ESCALETA_TEMPLATES/ESCALATA_TEMPLATE.md` | Yes |
| 4 | `03_ACTIVE_ESCALETAS/CURRENT_ESCALATA.md` | Yes |
| 5 | `06_PROJECT_INDEX/PROJECT_INDEX.md` | Yes |
| 6–10 | `05_HANDOFFS/projects/<SLUG>/planning/STATE.md` (one per active slug, max 5) | Pick active slugs only |

**After upload:** Run Prompt C (and optional Prompt D) from the specification manual.

---

## Source count checklist (operator)

Before running Studio:

- [ ] Notebook name follows `CT-<SLUG>-Architect` or `CT-Orchestration-Escaleta`
- [ ] Specification manual is source #1
- [ ] INTAKE.md uploaded for Profile A
- [ ] Total sources ≤ 50
- [ ] No secrets in upload set
- [ ] Custom instructions pasted (spec Section 4)

---

## Where outputs go

| Profile | Notebook output | Save location |
|---------|-----------------|---------------|
| A | Architect Pack 001 (6 files) | `05_HANDOFFS/projects/<SLUG>/` per prompt paths |
| A | Diagram narrative | `planning/sprints/001-discovery-architecture/blueprint.md` (merge) |
| B | Escaleta draft | `03_ACTIVE_ESCALETAS/CURRENT_ESCALATA.md` (human review) |
| either | Audio script | Operator notes only — not source of truth |
