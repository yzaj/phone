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
#       
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

# 功  能: 
# 使  用: 
# 参数 1:     [default: ]
# 返回值: 
# 备  注: 
