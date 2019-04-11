#!/bin/bash
#
# 函数
set -euo pipefail

###################################################################################################
#
#       err_mo
#       err_uo
#       get_nums
#
#       get_model
#       get_serial
#
###################################################################################################

# 功  能: 
# 使  用: 
# 参数 1: 
# 返回值: 
# 备  注: 该函数的使用范围受限
err_mo() {
  err "phone.sh: missing operand"
  exit "${E_MISSING_OPERAND}"
}

# 功  能: 
# 使  用: 
# 参数 1: 
# 返回值: 
# 备  注: 该函数的使用范围受限
err_uo() {
  err "phone.sh: unrecognized option '${phonearg}'"
  exit "${E_UNRECOGNIZED_OPTION}"
}

# 功  能: 
# 使  用: 
# 参数 1: 
# 返回值: 
# 备  注: 该函数的使用范围受限
get_nums() {
  phonenums="${phonenums}\n${phonenum}"
}

# 功  能: 通过手机列表的常量名, 包含的手机编号, 获取相对应的手机型号
# 使  用: 
# 参数 1:     [default: ]
# 返回值: 
# 备  注: 
get_model() {
  local num="$1"
  local model
  
  model="$(eval echo "\${PHONE${num}}")"
  echo "${model%-*}"
}

# 功  能: 通过手机列表的常量名, 包含的手机编号, 获取相对应的手机序列号
# 使  用: 
# 参数 1:     [default: ]
# 返回值: 
# 备  注: 
get_serial() {
  local num="$1"
  local serial
  
  serial="$(eval echo "\${PHONE${num}}")"
  echo "${serial#*-}"
}
