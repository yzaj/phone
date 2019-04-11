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
#       unlock
#       start_tl
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

# 功  能: 滑动解锁
# 使  用: unlock 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 在手机灭屏时使用
unlock() {
  local serial="$1"
  
  adb -s "${serial}" shell input keyevent 26
  adb -s "${serial}" shell input swipe 380 1200 380 800 500
  adb -s "${serial}" shell input swipe 600 350 150 350 500
}

# 功  能: 启动 TL
# 使  用: start_tl 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
start_tl() {
  local serial="$1"
  
  adb -s "${serial}" shell am start -n com.tencent.tmgp.tstl/.MainActivity
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
