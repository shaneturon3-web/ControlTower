# GitHub — Optional Builder Mirror

Handoff **source of truth** remains Google Drive `CONTROL TOWER/`, not GitHub.

## When to use GitHub

| Artifact | Repo pattern | Phase |
|----------|--------------|-------|
| `~/ShipYard` | Private `shipyard` repo | Engineering after CLI changes approved |
| Execution project | Private per-slug or monorepo `projects/<slug>` | Engineering only |
| Handoff packet | Do not use GitHub as SoT | Architect writes to `05_HANDOFFS/projects/<SLUG>/` |

## Rules

- Never commit `.env`, `rclone.conf`, `allamakey.txt`, tokens, or `~/.machine_env`
- Add `.venv/`, `__pycache__/`, secrets to `.gitignore`
- Link repo URL in `planning/FILE_INVENTORY.md` after repo exists
- Tag or release only after `STATE.md` and `DOMAIN.md` are locked (Architectural complete)

## ShipYard bootstrap

```bash
cd ~/ShipYard
git init
git add shipyard/ pyproject.toml Instructions.md bin/ share/
git commit -m "ShipYard CONTROL TOWER orchestrator"
```

Push to your private remote when ready.
