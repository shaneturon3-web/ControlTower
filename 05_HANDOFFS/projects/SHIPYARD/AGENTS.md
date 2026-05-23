# Agents — ShipYard Web

| Agent | Role in this project | Phase | Handoff target |
|-------|----------------------|-------|----------------|
| NotebookLM | Synthesize Architect Pack from CONTROL TOWER sources | Architectural | `05_HANDOFFS/projects/SHIPYARD/planning/` |
| Gemini | Decompose phases, cross-project planning | Architectural | Escaleta / blueprint sections |
| ChatGPT | Strategy, doctrine, copy polish | Architectural | INTAKE, DOMAIN |
| Cursor | Implement `~/ShipYard/web/` Worker + dashboard | Engineering | `EXECUTION_POINTER` → `~/ShipYard/web` |
| Human (Shane) | Phase gate, `wrangler deploy`, sync apply | All | `shipyard refurbish` / sync |
| Cloudflare Access | Zero Trust perimeter for production URL | Operational | N/A |

## Flow

```
Architect (NLM/Gemini/ChatGPT) → planning artifacts
        ↓
Cursor (Engineering) → ~/ShipYard/web
        ↓
Operator → wrangler deploy + shipyard refurbish SHIPYARD
```
