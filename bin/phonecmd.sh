#!/bin/bash
#
# 控制命令
set -euo pipefail

###################################################################################################
#
#       控制命令 reboot    对应于    函数名称 reboot
#       控制命令 vol-up    对应于    函数名称 vol_up
#       以此类推
#
###################################################################################################

###################################################################################################
#
#       reboot
#       vol_up
#
###################################################################################################

# 功  能: 重启
# 使  用: reboot 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
reboot() {
  local serial="$1"
  
  adb -s "${serial}" reboot
}

# 功  能: 
# 使  用: 
# 参数 1:     [default: ]
# 返回值: 
# 备  注: 
vol_up() {
  :
}

# 功  能: 
# 使  用: 
# 参数 1:     [default: ]
# 返回值: 
# 备  注: 
