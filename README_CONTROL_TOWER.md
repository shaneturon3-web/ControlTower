# CONTROL TOWER (Torre de Control)

## Purpose

**CONTROL TOWER** is the single alignment point for humans, local AIs, and cloud AIs.

- Coordinates agents, tools, handoffs, and escalatas
- Hosts all protocols for hardware, software, local/cloud AIs, and human operators
- Does **not** replace project execution directories or doctrine repositories

The former **Estafeta Protocol** is retired as a separate project; its rules live under `04_GLOBAL_RULES/`.

## Storage law

| Layer | Path | Role |
|-------|------|------|
| **Cloud** | Google Drive `CONTROL TOWER/` | Source of truth |
| **Mount** | `~/mnt/gdrive/CONTROL TOWER/` | Local tree synced to Drive by **rclone mount** |
| **Workspace** | `~/CONTROL TOWER` | Local tree (`~/CONTROL_TOWER` symlink for scripts) |

Google Drive = `~/mnt/gdrive` on this machine. Edit the mount path; the mount handles cloud sync.

See `ARCHITECTURE.md`.

## Boundary model

- `CONTROL_TOWER` = orchestration root
- `SUGARCUBE_DOCTRINE` = doctrine root
- Project folders (`PSYNOVA`, `E4C_CASE`, `FAMILY_OS`, `JOB_SEARCH`, `PORTFOLIO`, etc.) = execution zones

## Non-root rule

No AI may treat one project as the root of all projects. Each project has its own scope and working directory. Orchestration must explicitly assign a directory before execution.

## Folder map

| Folder | Duty |
|--------|------|
| `00_AGENT_REGISTRY` | Agent definitions, GPTs registry, Cursor rules mirror |
| `01_TOOL_INVENTORY` | Hardware, software, local and cloud AI tool profiles |
| `02_ESCALETA_TEMPLATES` | Escaleta templates |
| `03_ACTIVE_ESCALETAS` | Active escaletas |
| `04_GLOBAL_RULES` | All operational protocols (humans + AIs) |
| `05_HANDOFFS` | Project handoff matrix, planning, `project-start.md` |
| `06_PROJECT_INDEX` | Project pointers and domain boundaries |
| `07_LOGS` | Operator and sync logs |
| `08_BACKUPS` | `.old` archives and migration backups |
| `09_SYNCHRONIZATION` | Sync manifests, onboarding, migration docs |
| `10_ORCHESTRATION` | ShipYard CLI pointer and operator flows |

## ShipYard (Phase-2 orchestration)

**ShipYard** (`~/ShipYard`) lists indexed projects, seeds handoff packets, and gates Builder work:

- Per-slug Architect packet: `05_HANDOFFS/projects/<SLUG>/` (Cloud AI)
- Execution workspace: `~/Projects/` via `EXECUTION_POINTER.md` (Cursor)
- Operator guide: `10_ORCHESTRATION/SHIPYARD.md`

## Operational phases

Declare before work: `OPERATIONAL_PHASE=Research|Architectural|Engineering`

| Phase | Behavior |
|-------|----------|
| Research | Discovery only; populate `05_HANDOFFS/planning/INTAKE.md` or `05_HANDOFFS/projects/<SLUG>/planning/INTAKE.md` |
| Architectural | Lock `STATE.md`, `DOMAIN.md`; single path |
| Engineering | Execute with dry-run first; source `~/.machine_env` |

Full rules: `04_GLOBAL_RULES/CONTROL_TOWER-OPERATIONAL-PROTOCOL.md`

## Machine identity

- File: `~/.machine_env` (local only, **never synced**)
- Bootstrap: `~/bin/control-tower-bootstrap.sh`

## Onboarding (new agent or machine)

1. Read this README
2. Read `04_GLOBAL_RULES/CONTROL_TOWER-OPERATIONAL-PROTOCOL.md`
3. Run `~/bin/control-tower-pull.sh` (new machine)
4. Run `~/bin/control-tower-bootstrap.sh`
5. Receive assigned project folder from human operator

## Sync commands

```bash
~/bin/control-tower-adopt-mount.sh    # once: ~/CONTROL_TOWER → ~/mnt/gdrive/CONTROL TOWER
~/bin/control-tower-migrate-legacy.sh --apply
~/bin/control-tower-resume.sh
```

If `~/CONTROL_TOWER` is still a separate copy: `~/bin/control-tower-sync.sh --apply`

## Agent flow (registry)

See `00_AGENT_REGISTRY/01_registry.md`:

**Architect → TechnicalSpecialist → Closer → TacticalTranslator**
