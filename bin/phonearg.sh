#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

#### 常量 ####
readonly E_MISSING_OPERAND=1
readonly E_UNRECOGNIZED_OPTION=2

#### 函数 ####

#### 变量 ####

#### 主体 ####
# USAGE: phone.sh all 101-118 121-124 128 130 reboot,sleep:30,home-game
if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi







