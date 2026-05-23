# AGENT_REGISTRY

## Roles

- ChatGPT = strategy, synthesis, writing, doctrine refinement
- Gemini = large-context planning and decomposition
- NotebookLM = multi-source synthesis; Architect Pack 001 + Escaleta briefings from uploaded CONTROL TOWER folders
- Cursor = code/files/database execution (Engineering phase only)
- Agentlap/Ollama = local execution and cheap automation
- Grok = adversarial critique/stress testing
- Human/Shane = final authority and reality check

## CONTROL TOWER + ShipYard flow

```
Cloud AI (Architect)  →  edits 05_HANDOFFS/projects/<SLUG>/
        ↓
Operator: shipyard refurbish <SLUG>  (exit 0 required)
        ↓
Operator: shipyard sync <SLUG>  →  human runs sync --apply
        ↓
Cursor (Builder)  →  EXECUTION_POINTER.md → ~/Projects/...
```

- **Architect entry:** `04_GLOBAL_RULES/README-CLOUD-AI.md`
- **NotebookLM:** `04_GLOBAL_RULES/NOTEBOOKLM-ARCHITECTURE-SPECIFICATION.md`
- **Per-slug start:** `05_HANDOFFS/projects/<SLUG>/CLOUD_AI_ENTRY.md` and `NOTEBOOKLM_ENTRY.md`
- **CLI:** `~/ShipYard` — see `10_ORCHESTRATION/SHIPYARD.md`

## Legacy registry flow

See `00_AGENT_REGISTRY/01_registry.md`:

**Architect → TechnicalSpecialist → Closer → TacticalTranslator**
