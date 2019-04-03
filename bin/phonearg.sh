#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi

for phonearg in "$@"; do
  
  case "${phonearg}" in
    all)
      :
      ;;
    *)
      err "Unrecognized option '${phonearg}'"
      exit "${E_UNRECOGNIZED_OPTION}"
      ;;
  esac
  
done












