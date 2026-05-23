# Acceptance — Active Orchestration Node

## Definition of done

1. **Parsing accuracy** — WASM-based parser extracts a tree from a pasted repository manifest and renders it in the UI.
2. **D1 persistence** — Every node tag (`modify` / `replace` / `deprecated`) in the side pane streams to D1.
3. **Deployment routing** — "Deploy" triggers a documented webhook reaching the local execution agent via Tailscale (or signed queue polled by bridge).
4. **State visibility** — Dashboard shows deployment status (`provisioning`, `building`, `live`, `failed`) via SSE or polling.
5. **Sugar Cube integrity** — "Export Architecture Pack" produces one compressed text blob sufficient for an AI to recreate intended project state without semantic drift.

## Functional checks

- [ ] `002_orchestration.sql` applied locally and on remote D1
- [ ] `POST /api/workspaces/:slug/tree` persists parsed nodes
- [ ] `POST /api/deploy/:slug` creates `deployment_events` row
- [ ] `GET /api/sugar-cube/:slug/export` returns valid JSON/YAML bundle
- [ ] Local bridge doc reviewed; Tailscale hostname configured
- [ ] Cloudflare Access considered for `/api/deploy/*`

## Phase gate

Remain `OPERATIONAL_PHASE=Architectural` until human approves Engineering ship of bridge + WASM parser.
