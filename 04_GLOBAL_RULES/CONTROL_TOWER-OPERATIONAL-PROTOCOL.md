# CONTROL TOWER Operational Protocol (formerly Estafeta)

## 1. Operational Directives

### The Bootstrapper Fallback

**Identity Interception:** If a system process or AI agent attempts to run or alter an automated script and discovers that the local `~/.machine_env` file is missing, it must immediately halt normal execution and prompt the user interactively:

```
ERROR: .machine_env not found.
Do you want to add the current machine to the configuration system? (y/n)
```

**Dynamic Generation:** If the user selects `y`, the script must query the host's actual hardware name via `hostname`, prompt for a specific core role specification (e.g., workstation, server, mobile), and dynamically write the fresh `~/.machine_env` configuration file to the root of the home directory before proceeding.

### Operational Modes (Tri-Phase Protocol)

The AI agent must explicitly switch its behavior pattern based on the declared operational phase. It must never use methods from an unassigned phase.

```
┌────────────────────────────────────────┐
│              RESEARCH MODE             │ ← Divergent Discovery
│  Exploratory, Multi-Perspective, Open  │
└───────────────────┬────────────────────┘
                    │
                    ▼
┌────────────────────────────────────────┐
│       ARCHITECTURAL DESIGN MODE        │ ← Convergent Structuring
│ Modular Core Mapping & Node Relations  │
└───────────────────┬────────────────────┘
                    │
                    ▼
┌────────────────────────────────────────┐
│       ENGINEERING EXECUTION MODE       │ ← Deterministic Build
│   Dry-Run First, Hardcoded Isolation   │
└────────────────────────────────────────┘
```

#### Phase A: Research Mode

- **Objective:** Context gathering, discovery, and unconstrained ideation.
- **Behavior:** Explore multiple structural possibilities. Brainstorming, comparative analysis, and divergent discovery are allowed.
- **Constraint:** Do not write production code or execute system adjustments. Focus on `references/client-docs` and `planning/INTAKE.md`.

#### Phase B: Architectural Design Mode

- **Objective:** System mapping, establishing boundaries, and defining structural components.
- **Behavior:** Convergent thinking. Pressure-test frameworks, locate nodes, map relations, formalize `STATE.md` and `DOMAIN.md`.
- **Constraint:** Choose the single most effective logical path. Do not present multiple options or code variations. Lock blueprints before engineering.

#### Phase C: Engineering Execution Mode

- **Objective:** Direct code construction, system configuration, and script building.
- **Behavior:** Complete determinism. Minimal prose, execution bias. Scripts must parse environment profiles dynamically and adhere to safe defaults.
- **Constraint:** Focus on deterministic code that runs cleanly across physical nodes using unified architecture variables.

### Automation, Storage, & Scripting

- **Hardware-Agnostic Core:** All scripts and configurations must be uniform across platforms. No hardcoded machine names, paths, or network endpoints in main logic.
- **Local Identity Isolation:** Machine differentiation relies entirely on `~/.machine_env`. Main scripts read these variables for conditional operations.
- **Safety Defaults:** Dry-runs first, reversible actions, quarantine before deletion.
- **Storage Allocation:** Keep active workspace local; offload archives and media to external storage.

### Interface & UX

- **Screen Minimalism:** One primary action per view layer.
- **Input Subsystem Preservation:** Never alter Touchégg, system shortcuts, CopyQ, or keyboard layout without explicit request.

---

## 2. Machine-Readable AI Protocol

### Core Mandates

1. **Zero Alternations:** No machine-specific scripts or branching codebases per hardware.
2. **Single Username:** Username is identical across all machines (HP Elite, OptiPlex, Latitude).
3. **Environment Isolation:** Machine differentiation only via `~/.machine_env`. Never sync this file.
4. **Tri-Phase Adherence:** Follow the active phase rules only. Do not mix phases.

### Bootstrapper Interception Logic

```bash
echo "ERROR: .machine_env not found."
read -p "Do you want to add current machine to it? (y/n): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    LOCAL_HOST=$(hostname)
    read -p "Enter core role for $LOCAL_HOST (e.g., server, workstation): " local_role
    echo -e "export MACHINE_NAME=\"$LOCAL_HOST\"\nexport NETWORK_ROLE=\"$local_role\"" > "$HOME/.machine_env"
    echo ".machine_env initialized successfully."
else
    echo "Execution halted. Core environment unassigned." && exit 1
fi
```

### Scripting & Project Handoff Rules

- **No Hardcoding:** Never hardcode machine names, IPs, or unique mount paths.
- **Dynamic Sourcing:** Source `~/.machine_env` or architecture flags in every script.
- **Folder Structure:** For new handoffs, ensure:

```
├── references/
│   ├── client-docs/
│   └── source-app/
├── planning/
│   ├── STATE.md
│   ├── DOMAIN.md
│   ├── INTAKE.md
│   └── FILE_INVENTORY.md
└── project-start.md
```

### Global Shell Profile Block

```bash
# --- CORE MACHINE CONFIGURATION SYSTEM (ESTAFETA) ---
if [ -f "$HOME/.machine_env" ]; then
    source "$HOME/.machine_env"
else
    echo "ERROR: .machine_env not found."
    read -p "Do you want to add current machine to it? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        LOCAL_HOST=$(hostname)
        read -p "Enter core role for $LOCAL_HOST (e.g., server, workstation): " local_role
        echo -e "export MACHINE_NAME=\"$LOCAL_HOST\"\nexport NETWORK_ROLE=\"$local_role\"" > "$HOME/.machine_env"
        source "$HOME/.machine_env"
    else
        echo "WARNING: ~/.machine_env not found. System identity unassigned."
    fi
fi
# ----------------------------------------------------
```

### ShipYard pre-Engineering gate

Before Engineering execution on an indexed project:

1. Architect artifacts live in `05_HANDOFFS/projects/<SLUG>/` (or `05_HANDOFFS/planning/` for `CONTROL_TOWER`).
2. Operator runs `shipyard refurbish <SLUG>` — exit code **1** blocks automated chains.
3. Operator runs `shipyard sync <SLUG>` — validates `~/.machine_env` and mount; invokes sync **dry-run only**.
4. Human runs `09_SYNCHRONIZATION/sync_control_tower.sh --apply` (never auto-applied by ShipYard).

See `10_ORCHESTRATION/SHIPYARD.md` and `04_GLOBAL_RULES/README-CLOUD-AI.md`.

### Enforcement

Before modifying scripts or system setup, check interface with `~/.machine_env`. Reject approaches that split logic into machine-specific files or present divergent options outside the assigned phase.
