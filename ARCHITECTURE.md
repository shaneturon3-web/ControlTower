# CONTROL TOWER — Storage Architecture

## Paths (read carefully)

| Name | Path |
|------|------|
| Work tree | **`~/CONTROL TOWER`** (space between words) |
| Symlink | `~/CONTROL_TOWER` → `~/CONTROL TOWER` |
| Mount root | `~/mnt/gdrive` |
| Tower on mount | `~/mnt/gdrive/CONTROL TOWER` |

Using `~/CONTROL_TOWER` as a real folder (underscore only) was a configuration error that blocked automation.

## Three zones (ShipYard)

| Zone | Path | Role |
|------|------|------|
| Transport | `~/mnt/gdrive/CONTROL TOWER/` | Drive-synced evidence |
| Semantic | `~/CONTROL TOWER/05_HANDOFFS/projects/<SLUG>/` | Architect packet (Cloud AI) |
| Execution | `~/Projects/<date>-slug/` | Builder workspace (Cursor) |

CLI: `~/ShipYard` — see `10_ORCHESTRATION/SHIPYARD.md`.

## Sync flow

1. Edit files in **`~/CONTROL TOWER`**
2. `shipyard sync <SLUG>` validates mount and runs `sync_control_tower.sh --dry-run`
3. Operator runs **`~/CONTROL TOWER/09_SYNCHRONIZATION/sync_control_tower.sh --apply`** or **`~/bin/control-tower-sync.sh --apply`**
4. **rclone mount** on `~/mnt/gdrive` syncs to Google Drive / Gmail

Legacy **`rclone copy`** script: `09_SYNCHRONIZATION/sync_control_tower.sh` uses `LOCAL_ROOT="${HOME}/CONTROL TOWER"`.

## Canonical spelling

- **Escaleta** folders: `02_ESCALETA_TEMPLATES`, `03_ACTIVE_ESCALETAS`
- Not `ESCALATA` (typo)

## Never sync

- `~/.machine_env`
- `~/.config/rclone/rclone.conf`

## Retired

- Case Shield / Estafeta as separate projects
- `rclone copy` to `GD:` as primary workflow (mount-first instead)
