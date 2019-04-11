#!/bin/bash
#
# 初始化
set -euo pipefail

if ! type adb; then
  err "phone.sh: adb not found"
  exit "${E_NOT_FOUND}"
fi

if [[ -s "${phonestart}" ]]; then
  start_time="$(cat "${phonestart}")"
fi

readonly start_time

if (((current_time - start_time) > (interval_time * 60))); then
  adb kill-server || true
  sleep 3
  adb start-server
  sleep 1
  
  echo "${current_time}" > "${phonestart}"
fi
