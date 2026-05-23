# NotebookLM Architecture Specification Manual

**Version:** 1.0  
**Scope:** CONTROL TOWER indexed projects (`06_PROJECT_INDEX`)  
**Canonical companion:** `NOTEBOOKLM-SOURCE-MANIFEST.md`

---

## 1. Role and boundaries

| Rule | Requirement |
|------|-------------|
| Role | Architectural **synthesizer** from uploaded sources |
| Phase | Research + Architectural only |
| Forbidden | Production code, scripts, config files with secrets |
| Non-root | **One slug per notebook** — never merge PSYNOVA + E4C_CASE in one session |
| Source of truth | Files under `05_HANDOFFS/projects/<SLUG>/` on Drive — not NotebookLM chat history |
| Human step | Operator copies Studio output into markdown files, then runs ShipYard gates |

**Do not upload:** `~/.machine_env`, `rclone.conf`, API keys, tokens, `allamakey.txt`.

**Path style:** Use `$HOME/CONTROL TOWER` or role names — never hardcode `/home/shane/`.

---

## 2. Three-zone context

| Zone | Path | NotebookLM uses for |
|------|------|---------------------|
| Transport | `$HOME/mnt/gdrive/CONTROL TOWER/` | What is synced to Google Drive |
| Semantic | `$HOME/CONTROL TOWER/05_HANDOFFS/projects/<SLUG>/` | **Write targets** (human saves NLM output here) |
| Execution | `$HOME/Projects/` (see `EXECUTION_POINTER.md`) | Scope boundary — no implementation detail until Engineering |

See `ARCHITECTURE.md` and `10_ORCHESTRATION/SHIPYARD.md`.

---

## 3. Notebook setup procedure

1. **Name the notebook:** `CT-<SLUG>-Architect` (example: `CT-PSYNOVA-Architect`) or `CT-Orchestration-Escaleta` for cross-project work.
2. **Upload sources** in order from `NOTEBOOKLM-SOURCE-MANIFEST.md` (Profile A or B).
3. **Paste custom instructions** (Section 4) into NotebookLM notebook settings.
4. **Run Studio prompts** (Section 5) one at a time; review each output.
5. **Save artifacts** into the handoff folder paths listed in each prompt.
6. **Gate:** `shipyard refurbish <SLUG>` then `shipyard sync <SLUG>`; operator runs sync `--apply`.
7. **Builder:** Cursor opens `EXECUTION_POINTER.md` only after `OPERATIONAL_PHASE=Engineering`.

---

## 4. Notebook custom instructions (paste into NotebookLM)

```text
You are the CONTROL TOWER Architect synthesizer for a single project slug.

Rules:
- Use only uploaded sources. If information is missing, list questions — do not invent requirements.
- Never output production code, shell scripts, or credentials.
- Never merge multiple project slugs into one architecture.
- All deliverables must be markdown with exact filenames shown in prompts.
- Include OPERATIONAL_PHASE=Architectural in STATE.md unless still in Research.
- Reference ShipYard gates: refurbish before Builder; sync is operator-only for --apply.
- Map every major requirement to a section in INTAKE.md.
- DOMAIN.md must list explicit out-of-scope items.
- acceptance.md must have testable checkboxes and Definition of Done.

Output language: English. Tone: precise, operational, no hype.
```

---

## 5. Studio prompt templates

Copy each block into NotebookLM Studio as a new generation. Replace `<SLUG>` and `<PROJECT_NAME>`.

### Prompt A — Architect Pack 001 (primary)

```text
Using only the uploaded sources for project <SLUG> (<PROJECT_NAME>), produce Architect Pack 001.

Output six separate markdown documents. Label each with a heading line: === FILE: <path> ===

1) === FILE: planning/STATE.md ===
Include line: OPERATIONAL_PHASE=Architectural
Sections: Current state, Constraints, Tech stack (proposed), Integration health table, Open questions.

2) === FILE: planning/DOMAIN.md ===
Sections: In scope, Out of scope (explicit list), Entities and relationships, Business rules, Edge cases.

3) === FILE: planning/FILE_INVENTORY.md ===
Table: Path | Role — include handoff folder, execution pointer, references/, sprint files, optional GitHub repo.

4) === FILE: planning/sprints/001-discovery-architecture/blueprint.md ===
Sections: Overview, System Architecture (components, data flow, external integrations: Google Drive, ShipYard, multi-machine), Modules/Packages, Data Model, Non-Functional Requirements (performance, security, scalability, observability), Tech Decisions with rationale.

5) === FILE: planning/sprints/001-discovery-architecture/acceptance.md ===
Sections: Functional Acceptance (checkboxes), Test Scenarios (happy path, edge, error), Definition of Done (checkboxes). Every INTAKE acceptance criterion must map to a checkbox.

6) === FILE: AGENTS.md ===
Table: Agent | Role in this project | Phase | Handoff target — subset from AGENT_REGISTRY (Gemini, ChatGPT, NotebookLM, Cursor, Human).

Constraints: No code blocks except short interface sketches. Detail approvals, data validation, and error handling. Cite INTAKE section IDs where possible.
```

### Prompt B — System context diagram

```text
For project <SLUG>, using uploaded sources only, produce:

1) A Mermaid flowchart or C4-style diagram showing: Cloud AI (NotebookLM/Gemini/ChatGPT), CONTROL TOWER handoff folder, Google Drive transport, ShipYard CLI gates, Cursor Builder, execution workspace.

2) A narrative (200-400 words) for the blueprint.md "System Architecture" section explaining data flow and trust boundaries.

Do not produce other files. No code implementation.
```

### Prompt C — Escaleta summary

```text
Use NOTEBOOKLM-ESCALETA-PROMPT.md discipline. Produce one markdown document:

=== FILE: ESCALETA_DRAFT.md ===

Sections exactly: Objective, Project, Assigned agent/tool, Working directory, Inputs, Outputs, Stop conditions, Evidence required, Risks, Next handoff.

Cover cross-project priorities from PROJECT_INDEX and CURRENT_ESCALATA. Max 5 active projects. Stop condition must be verifiable.
```

(Full Escaleta prompt also in `02_ESCALETA_TEMPLATES/NOTEBOOKLM-ESCALETA-PROMPT.md`.)

### Prompt D — Audio overview script (optional)

```text
Write a 5-minute spoken briefing script for the operator (Shane) about project <SLUG>.

Include: current phase, top 3 risks, what is missing from INTAKE, next actions (refurbish, sync apply, or open Architect chat), and whether Builder phase is allowed yet.

Do not replace written Architect Pack files. Conversational but precise.
```

---

## 6. Output quality rubric

Score each dimension **Pass / Fail** before handoff to Cursor:

| Criterion | Pass condition |
|-----------|----------------|
| Phase | `OPERATIONAL_PHASE=` correct in `planning/STATE.md` |
| Completeness | All six Architect Pack files exist and are non-empty |
| Traceability | Major requirements reference INTAKE sections |
| Boundaries | DOMAIN.md has explicit out-of-scope |
| Builder-ready | acceptance.md has testable checkboxes + DoD |
| No drift | No machine-specific absolute paths or secrets |
| ShipYard-ready | project-start checklist items can be checked where true |

---

## 7. Handoff to ShipYard and Cursor

After human saves NotebookLM output into `05_HANDOFFS/projects/<SLUG>/`:

```bash
cd ~/ShipYard && source .venv/bin/activate
shipyard refurbish <SLUG>
shipyard sync <SLUG>
```

Operator completes cloud sync:

```bash
~/CONTROL TOWER/09_SYNCHRONIZATION/sync_control_tower.sh --apply
```

Set `OPERATIONAL_PHASE=Engineering` in slug `STATE.md` only after human approval. Cursor reads `EXECUTION_POINTER.md`.

---

## 8. Tool routing (where NotebookLM fits)

| Tool | Use when |
|------|----------|
| **NotebookLM** | Multi-document synthesis → Architect Pack 001 + Escaleta briefings |
| Gemini | Large-context decomposition, task breakdown |
| ChatGPT | Strategy, doctrine, writing polish |
| Cursor | Engineering execution |
| Human | Phase declaration, sync apply, final authority |

See `04_GLOBAL_RULES/sugar-cubes/SC-PROTOCOL-005-Tool-Routing-Map.md`.

---

## 9. Per-slug quick entry

Each project folder may include `NOTEBOOKLM_ENTRY.md` with slug-specific source list and notebook name. Template: `05_HANDOFFS/projects/_TEMPLATE/NOTEBOOKLM_ENTRY.md`.
