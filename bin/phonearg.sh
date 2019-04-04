#!/bin/bash
#
# 控制手机的参数
set -euo pipefail

#### 常量 ####
readonly E_MISSING_OPERAND=1
readonly E_UNRECOGNIZED_OPTION=2

#### 函数 ####
# 该函数的使用范围受限
err_mo() {
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
}

# 该函数的使用范围受限
err_uo() {
  err "Unrecognized option '${phonearg}'"
  exit "${E_UNRECOGNIZED_OPTION}"
}

# 该函数的使用范围受限
get_nums() {
  phonenums="${phonenums}\n${phonenum}"
}

#### 变量 ####
phonenums=''
phonecmds=''

#### 主体 ####
# USAGE: phone.sh all 101-118 121-124 128 130 reboot,sleep:30,home-game
if (($# < 2)); then
  err_mo
fi

for phonearg in "$@"; do
  # 获取所有的 all 参数
  if [[ "${phonearg}" == "all" ]]; then
    phonenum="$(seq 101 "${ENDNUM}")"
    get_nums
  
  # 获取所有形如 101-118 的参数
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]-[1-2][0-9][0-9]$ ]]; then
    phonearg_head="${phonearg%-*}"
    phonearg_tail="${phonearg#*-}"
    
    if ((101 <= phonearg_head)) && ((phonearg_head < phonearg_tail)) && ((phonearg_tail <= ENDNUM)); then
      phonenum="$(seq "${phonearg_head}" "${phonearg_tail}")"
      get_nums
    else
      err_uo
    fi
  
  # 获取所有形如 101 的参数
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]$ ]] && ((101 <= phonearg)) && ((phonearg <= ENDNUM)); then
    phonenum="${phonearg}"
    get_nums
  
  # 获取最后一次输入的命令组
  elif [[ "${phonearg}" =~ ^[A-Za-z][A-Za-z0-9,:-]*[A-Za-z0-9,]$ ]]; then
    phonecmds="${phonearg//,/ }"
    phonecmds="${phonecmds//-/_}"
    
    for phonecmd in ${phonecmds}; do
      if [[ "${phonecmd}" =~ ^sleep:[0-9]*$ || "$(type -t "${phonecmd}")" == "function" ]]; then
        :
      else
        err_uo
      fi
    done
  
  # 否则
  else
    err_uo
  fi
done





















echo -e "${phonenums}"
echo "${phonecmds}"