#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi
















