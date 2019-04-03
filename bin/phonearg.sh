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








phonenum=''
phonecmd=''

if (($# < 2)); then
  err "Missing operand"
  exit "${E_MISSING_OPERAND}"
fi

for phonearg in "$@"; do
  
  if [[ "${phonearg}" == "all" ]]; then
    phonenum="$(seq 101 "${ENDNUM}" | xargs)"
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9,-]*[0-9]$ ]]; then
    
    phone_args="${phonearg//,/ }"
    
    for phone_arg in ${phone_args}; do
      
      echo $phone_arg
      
    done
    
  elif [[ "${phonearg}" =~ ^[A-Za-z][A-Za-z0-9,:-]*[A-Za-z0-9]$ ]]; then
    :
  else
    err "Unrecognized option '${phonearg}'"
    exit "${E_UNRECOGNIZED_OPTION}"
  fi
  
done








echo "${phonenum}"





