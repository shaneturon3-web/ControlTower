# NotebookLM Studio Prompt — Escaleta

**Notebook:** `CT-Orchestration-Escaleta`  
**Sources:** Profile B in `04_GLOBAL_RULES/NOTEBOOKLM-SOURCE-MANIFEST.md`

---

## Paste into NotebookLM Studio

```text
You are producing a CONTROL TOWER Escaleta — a cross-project orchestration brief for the human operator.

Use only uploaded sources. Align section headings exactly with ESCALATA_TEMPLATE.md.

Produce one document:

=== FILE: ESCALETA_DRAFT.md ===

## Objective
One paragraph: what orchestration outcome is needed this cycle (sync health, slug priorities, doctrine verification, etc.).

## Project
Primary slug in focus, plus up to four secondary slugs from PROJECT_INDEX. State why ordered this way.

## Assigned agent/tool
Who does what next: NotebookLM (synthesis done), Gemini (decomposition), ChatGPT (strategy), Cursor (Builder), Human (apply/sync). No agent runs sync --apply autonomously.

## Working directory
Canonical path: $HOME/CONTROL TOWER for orchestration; per-slug handoff at 05_HANDOFFS/projects/<SLUG>/; execution paths only via EXECUTION_POINTER.md.

## Inputs
Bulleted list of evidence already in sources (STATE.md summaries, CURRENT_ESCALATA, INDEX).

## Outputs
Concrete artifacts to exist by stop condition (files, refurbish pass, sync dry-run log, etc.).

## Stop conditions
Verifiable checks — e.g. "shipyard refurbish PSYNOVA exits 0", "CURRENT_ESCALATA updated", "Drive mount contains 05_HANDOFFS/projects/".

## Evidence required
What the operator must paste or point to before closing the Escaleta (log path, checklist, Drive path).

## Risks
Top 3–5 risks across projects (path drift, incomplete INTAKE, phase mismatch, duplicate 07_LOGS edits, etc.).

## Next handoff
Single next action with assigned tool and folder path.

Constraints:
- Do not merge unrelated slugs into one product architecture.
- Do not output code or credentials.
- Reference ShipYard gates where Engineering is proposed.
```

---

## After generation

1. Human reviews `ESCALETA_DRAFT.md` in NotebookLM.
2. Copy approved content into `03_ACTIVE_ESCALETAS/CURRENT_ESCALATA.md` or a dated file under `03_ACTIVE_ESCALETAS/`.
3. Run per-slug `shipyard refurbish` before any Builder work on affected slugs.
