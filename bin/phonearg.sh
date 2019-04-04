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
phonenums=''
phonecmds=''

#### 主体 ####
# USAGE: phone.sh all 101-118 121-124 128 130 reboot,sleep:30,home-game
if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi

for phonearg in "$@"; do
  if [[ "${phonearg}" == "all" ]]; then
    phonenum="$(seq 101 "${ENDNUM}")"
    phonenums="${phonenums}\n${phonenum}"
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]-[1-2][0-9][0-9]$ ]]; then
    phonearg_head="${phonearg%-*}"
    phonearg_tail="${phonearg#*-}"
    
    if ((101 <= phonearg_head)) && ((phonearg_head < phonearg_tail)) && ((phonearg_tail <= ENDNUM)); then
      phonenum="$(seq "${phonearg_head}" "${phonearg_tail}")"
      phonenums="${phonenums}\n${phonenum}"
    else
      err_uo
    fi
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]$ ]]; then
    
    :
    
  elif [[ "${phonearg}" =~ ^[A-Za-z][A-Za-z0-9,:-]*[A-Za-z0-9]$ ]]; then
    
    :
    
  else
    err_uo
  fi
done



echo -e "${phonenums}"