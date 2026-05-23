#!/usr/bin/env bash
# Publish CONTROL TOWER docs to GitHub (shaneturon3-web/ControlTower).
# Requires one-time: ~/bin/gh auth login
set -euo pipefail

export PATH="${HOME}/bin:${PATH}"
REPO="shaneturon3-web/ControlTower"
ROOT="${HOME}/CONTROL TOWER"
BRANCH="${1:-main}"

cd "${ROOT}"

if ! command -v gh >/dev/null 2>&1; then
  echo "Install gh to ~/bin or PATH first."
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Not logged in. Run: gh auth login"
  echo "Then re-run: $0"
  exit 1
fi

if [ ! -d .git ]; then
  echo "No .git in CONTROL TOWER — run git init and initial commit first."
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  if gh repo view "${REPO}" >/dev/null 2>&1; then
    gh repo clone "${REPO}" /tmp/ct-clone-check 2>/dev/null || true
    git remote add origin "https://github.com/${REPO}.git"
  else
    gh repo create "${REPO}" \
      --private \
      --description "CONTROL TOWER orchestration — NotebookLM architecture and handoffs" \
      --source=. \
      --remote=origin \
      --push
    echo ""
    echo "NotebookLM — point to this file (raw):"
    echo "https://raw.githubusercontent.com/${REPO}/${BRANCH}/NOTEBOOKLM.md"
    exit 0
  fi
fi

git push -u origin "${BRANCH}"
echo ""
echo "NotebookLM — point to this file (raw):"
echo "https://raw.githubusercontent.com/${REPO}/${BRANCH}/NOTEBOOKLM.md"
