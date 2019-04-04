#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

#### 常量 ####
readonly E_MISSING_OPERAND=1
readonly E_UNRECOGNIZED_OPTION=2

#### 函数 ####
# 该函数的使用范围受限
err_uo() {
  err "Unrecognized option '${phonearg}'"
  exit "${E_UNRECOGNIZED_OPTION}"
}

#### 变量 ####
phonenum=''
phonenums=''

#### 主体 ####
# USAGE: phone.sh all 101-118 121-124 128 130 reboot,sleep:30,home-game
if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi

for phonearg in "$@"; do
  
  if [[ "${phonearg}" == "all" ]]; then
    phonenum="$(seq 101 "${ENDNUM}")"
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]-[1-2][0-9][0-9]$ ]]; then
  :
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]$ ]]; then
  :
  elif [[ "${phonearg}" =~ ^[A-Za-z][A-Za-z0-9,:-]*[A-Za-z0-9]$ ]]; then
  :
  else
    err_uo
  fi
  
  phonenums="${phonenums} ${phonenum}"
  
done



echo "${phonenums}"