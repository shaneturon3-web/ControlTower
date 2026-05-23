#!/usr/bin/env bash
set -euo pipefail

LOCAL_ROOT="${HOME}/CONTROL TOWER"
LOG_DIR="${LOCAL_ROOT}/09_SYNCHRONIZATION/logs"
LOG_FILE="${LOG_DIR}/sync.log"
REMOTE="GD:CONTROL TOWER"
CONFLICT_STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
BACKUP_DIR="GD:CONTROL TOWER/08_BACKUPS/sync-conflicts/${CONFLICT_STAMP}"
PROBE_FILE="${REMOTE}/09_SYNCHRONIZATION/.probe_${CONFLICT_STAMP}.txt"

SYNC_TIMEOUT_SECONDS="${SYNC_TIMEOUT_SECONDS:-180}"
PREFLIGHT_TIMEOUT_SECONDS="${PREFLIGHT_TIMEOUT_SECONDS:-45}"
SYNC_MAX_RETRIES="${SYNC_MAX_RETRIES:-3}"
SYNC_RETRY_DELAY_SECONDS="${SYNC_RETRY_DELAY_SECONDS:-8}"

DRY_RUN=0
APPLY=0
for arg in "$@"; do
  case "${arg}" in
    --dry-run) DRY_RUN=1 ;;
    --apply) APPLY=1 ;;
  esac
done
if [ "${DRY_RUN}" -eq 0 ] && [ "${APPLY}" -eq 0 ]; then
  APPLY=1
fi

mkdir -p "${LOG_DIR}"

log() {
  printf '%s %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$1" | tee -a "${LOG_FILE}"
}

fail() {
  log "FAIL: $1"
  exit 1
}

[ -d "${LOCAL_ROOT}" ] || fail "local root missing: ${LOCAL_ROOT}"
command -v rclone >/dev/null 2>&1 || fail "rclone not installed"
command -v timeout >/dev/null 2>&1 || fail "timeout command not installed"
rclone listremotes | rg -n '^GD:$' >/dev/null || fail "GD remote not configured"

[ "${SYNC_MAX_RETRIES}" -ge 1 ] || fail "SYNC_MAX_RETRIES must be >= 1"
[ "${SYNC_TIMEOUT_SECONDS}" -ge 1 ] || fail "SYNC_TIMEOUT_SECONDS must be >= 1"
[ "${PREFLIGHT_TIMEOUT_SECONDS}" -ge 1 ] || fail "PREFLIGHT_TIMEOUT_SECONDS must be >= 1"

if [ "${DRY_RUN}" -eq 1 ]; then
  log "DRY-RUN sync_control_tower"
  log "LOCAL_ROOT=${LOCAL_ROOT}"
  log "REMOTE=${REMOTE}"
  log "Would run: rclone copy (with backup-dir) after preflight"
  log "RESULT=DRY_RUN_PASS"
  printf 'DRY-RUN OK: LOCAL_ROOT=%s REMOTE=%s\n' "${LOCAL_ROOT}" "${REMOTE}"
  exit 0
fi

preflight_probe() {
  log "PREFLIGHT start"
  timeout "${PREFLIGHT_TIMEOUT_SECONDS}" rclone mkdir "${REMOTE}" || fail "preflight mkdir timeout/failure"
  printf 'control_tower_probe=%s\n' "${CONFLICT_STAMP}" | timeout "${PREFLIGHT_TIMEOUT_SECONDS}" rclone rcat "${PROBE_FILE}" || fail "preflight write timeout/failure"
  timeout "${PREFLIGHT_TIMEOUT_SECONDS}" rclone deletefile "${PROBE_FILE}" || fail "preflight cleanup timeout/failure"
  log "PREFLIGHT pass"
}

run_sync_once() {
  timeout "${SYNC_TIMEOUT_SECONDS}" rclone copy "${LOCAL_ROOT}" "${REMOTE}" \
    --metadata \
    --create-empty-src-dirs \
    --backup-dir "${BACKUP_DIR}" \
    --suffix ".conflict-${CONFLICT_STAMP}" \
    --checkers 8 \
    --transfers 4 \
    --log-file "${LOG_FILE}" \
    --log-level INFO
}

log "START sync_control_tower"
log "LOCAL_ROOT=${LOCAL_ROOT}"
log "REMOTE=${REMOTE}"
log "BACKUP_DIR=${BACKUP_DIR}"

attempt=1
while [ "${attempt}" -le "${SYNC_MAX_RETRIES}" ]; do
  log "ATTEMPT ${attempt}/${SYNC_MAX_RETRIES}"
  preflight_probe
  if run_sync_once; then
    log "DONE sync_control_tower"
    log "RESULT=PASS"
    exit 0
  fi
  if [ "${attempt}" -lt "${SYNC_MAX_RETRIES}" ]; then
    log "WARN: attempt ${attempt} failed, retrying in ${SYNC_RETRY_DELAY_SECONDS}s"
    sleep "${SYNC_RETRY_DELAY_SECONDS}"
  fi
  attempt=$((attempt + 1))
done

fail "sync failed after ${SYNC_MAX_RETRIES} attempts"
