# System State — SHIPYARD Active Orchestration Node

**Last updated:** 2026-05-23

`OPERATIONAL_PHASE=Architectural`

## Current state

- **ShipYard Web** is a Phase 1 MVP (read-only + new pending), deployed at `https://shipyard-web.shaneturon3.workers.dev/`.
- **ShipYard CLI** handles local project indexing and scaffolding via Python on the OptiPlex server.
- **D1** holds project index mirror; no tree/deployment state machine yet.

## Target state

- **Active orchestration node**: ShipYard Web is the primary UI for triggering deployments and parsing manifests.
- **State machine**: Static JSON representation evolves into an event-driven relational model in **Cloudflare D1**.
- **Context bundler**: Compile **Sugar Cubes** (structured high-gravity text blobs) for Cursor, Claude, and NotebookLM.
- **Semantic router**: Workers route instructions to local compute via **Tailscale** bridge — Workers do not compile code.

## Integration health

| Component | Status |
|-----------|--------|
| ShipYard Web (MVP) | Live — `shipyard-web.shaneturon3.workers.dev` |
| Orchestration schema (002) | Engineering — `web/schema/002_orchestration.sql` |
| WASM tree parser | Engineering — client-side stub |
| Local execution bridge | Planned — `web/docs/LOCAL_EXECUTION_BRIDGE.md` |
| R2 planning snapshots | Blocked — R2 not enabled on account |
| Cloudflare Access | Recommended for production orchestration routes |
