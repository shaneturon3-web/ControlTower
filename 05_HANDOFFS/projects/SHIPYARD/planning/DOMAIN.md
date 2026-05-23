# Domain — Active Orchestration Node

## Entities

### Project workspace

Root container for project state: immutable **before** snapshot and **target** modifications.

### WASM tree parser

In-browser logic to extract directory structures from pasted manifests or uploads without server-side compilation.

### Deployment event

State-tracked object in D1: `provisioning` → `building` → `live` → `failed`.

### Sugar Cube (context bundle)

Compressed serialized payload: directory state, change checklists, functional specs for downstream AI.

### Tracking target

File-tree node with metadata: `modify`, `replace`, `deprecated`, or `unchanged`.

## Storage

| Store | Role |
|-------|------|
| D1 | Projects, tree nodes, deployment events, sugar cube records |
| R2 (future) | Large blueprint / planning snapshots |
| Local node | Docker execution via Tailscale bridge |

## Out of scope (explicit)

- **Direct binary execution on Workers** — Workers are a **semantic router** only
- **Public unauthenticated orchestration** — gate behind **Cloudflare Access**
- Replacing ShipYard CLI or CONTROL TOWER handoff folders as source of truth
