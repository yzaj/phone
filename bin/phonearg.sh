#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

phonenum=''
phonecmd=''

if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi

for phonearg in "$@"; do
  
  if [[ "${phonearg}" == "all" ]]; then
    :
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9,-]*[0-9]$ ]]; then
    :
  elif [[ "${phonearg}" =~ ^[A-Za-z][A-Za-z0-9,:-]*[A-Za-z0-9]$ ]]; then
    :
  else
    err "Unrecognized option '${phonearg}'"
    exit "${E_UNRECOGNIZED_OPTION}"
  fi
  
done
