#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi

for phonearg in "$@"; do
  
  if [[ "${phonearg}" == "all" ]]; then
    :
  else
    err "Unrecognized option '${phonearg}'"
    exit "${E_UNRECOGNIZED_OPTION}"
  fi
  
done












