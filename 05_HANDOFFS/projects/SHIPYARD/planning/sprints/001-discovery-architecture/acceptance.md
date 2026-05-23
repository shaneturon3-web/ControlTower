# Acceptance — ShipYard Web

## Functional acceptance

- [ ] **Dashboard visibility** — Web UI lists all projects in D1 with slug, name, phase, sync state, handoff-ready flag
- [ ] **API projects** — `GET /api/projects` returns JSON array matching seeded index
- [ ] **API detail** — `GET /api/projects/:slug` returns single project or 404
- [ ] **Scaffold triggering** — `POST /api/new` creates pending D1 row and returns `shipyard new` command payload (Phase 2)
- [ ] **AI accessibility** — `GET /api/audit/:slug` returns blueprint metadata or R2 object (Phase 3)
- [ ] **Handoff indicator** — Dashboard shows Handoff Ready when required planning files exist (flag in D1 or computed at seed)
- [ ] **CLI compatibility** — `shipyard list` still reads `PROJECT_INDEX.md`; D1 seed matches slugs

## Test scenarios

### Happy path

1. Run `npm run db:local` and `npm run dev` in `~/ShipYard/web`.
2. Open dashboard; see CONTROL_TOWER, SHIPYARD, PSYNOVA, etc.
3. `curl localhost:8787/api/projects` returns 200 JSON.

### Edge cases

- Unknown slug → 404 on detail/audit routes
- Empty D1 → empty list, UI message

### Error cases

- Invalid JSON on `POST /api/new` → 400

## Definition of done

- [ ] Architect Pack 001 files saved under `05_HANDOFFS/projects/SHIPYARD/planning/`
- [ ] `~/ShipYard/web/` deployable with `wrangler dev`
- [ ] D1 schema applied locally
- [ ] README in `web/` documents deploy and CLI bridge
- [ ] `OPERATIONAL_PHASE` remains Architectural until human approves Engineering ship
- [ ] No secrets committed to GitHub
