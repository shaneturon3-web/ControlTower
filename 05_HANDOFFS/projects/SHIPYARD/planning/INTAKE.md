# INTAKE — ShipYard as CONTROL TOWER Upgrade

Date: 2026-05-22
Status: In progress
Slug: `SHIPYARD`

## Request

Integrate ShipYard as the Phase-2 orchestration layer so Cloud AI can see per-project Architect packets on Drive and Cursor can build from linked execution workspaces.

## Delivered in this integration

- Per-slug handoffs under `05_HANDOFFS/projects/<SLUG>/`
- `shipyard` CLI: list, new, refurbish, sync (dry-run), register
- Expanded `README-CLOUD-AI.md` and `10_ORCHESTRATION/SHIPYARD.md`

## ShipYard Web (2026-05-23)

Evolve CLI into Cloudflare-native dashboard (Pages, Workers, D1, R2) while keeping local `shipyard` workflows. See sprint `001-discovery-architecture/blueprint.md`.

## Constraints

- `shipyard sync` never auto-runs `--apply`
- Web UI must not execute shell on OptiPlex
- No machine-specific path forks; use `$HOME` / `Path.home()`
- Never sync `~/.machine_env` or rclone credentials
