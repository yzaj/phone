#!/bin/bash
#
# 控制命令
set -euo pipefail

###################################################################################################
#
#       控制命令 reboot     对应于    函数名称 reboot
#       控制命令 skip-tl    对应于    函数名称 skip_tl
#       以此类推
#
###################################################################################################

###################################################################################################
#
#       reboot
#       unlock
#       start_tl
#       update_tl
#       skip_tl
#       exit_tl
#       start_fw
#       use_fw
#       run_fw
#       exit_fw
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
# 使  用: start_tl 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 
start_tl() {
  local serial="$1"
  local model="$2"
  local i
  
  adb -s "${serial}" shell am start -n com.tencent.tmgp.tstl/.MainActivity
  
  if [[ "${model}" == "xiaominote" ]]; then
    for i in $(seq 3); do
      adb -s "${serial}" shell input keyevent 25
    done
  fi
}

# 功  能: 更新 TL
# 使  用: update_tl 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 点击确定
update_tl() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 1220 710
    return
  fi
  
  adb -s "${serial}" shell input tap 860 470
}

# 功  能: 跳过 TL
# 使  用: skip_tl 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 点击屏幕
skip_tl() {
  local serial="$1"
  
  adb -s "${serial}" shell input tap 860 470
}

# 功  能: 退出 TL
# 使  用: exit_tl 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 
exit_tl() {
  local serial="$1"
  local model="$2"
  local i
  
  if [[ "${model}" == "xiaominote" ]]; then
    for i in $(seq 9); do
      adb -s "${serial}" shell input keyevent 25
    done
  fi
  
  adb -s "${serial}" shell am force-stop com.tencent.tmgp.tstl
}

# 功  能: 启动 FW
# 使  用: start_fw 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
start_fw() {
  local serial="$1"
  
  adb -s "${serial}" shell am start -n com.cyjh.gundam/.fengwo.ui.activity.WelcomeActivity
}

# 功  能: 运用 FW
# 使  用: use_fw 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 
use_fw() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" ]]; then
    adb -s "${serial}" shell input tap 950 1960
  fi
  
  if [[ "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 950 1850
  fi
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 950 605
    adb -s "${serial}" shell input swipe 550 650 550 1050 500
    adb -s "${serial}" shell input tap 940 490
    return
  fi
  
  adb -s "${serial}" shell input tap 640 1300
  adb -s "${serial}" shell input tap 635 460
  adb -s "${serial}" shell input swipe 350 550 350 950 500
  adb -s "${serial}" shell input tap 625 370
}

# 功  能: 运行 FW
# 使  用: run_fw 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 
run_fw() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 800 1525
  else
    adb -s "${serial}" shell input tap 550 1060
  fi
  
  adb -s "${serial}" shell input keyevent 24
}

# 功  能: 退出 FW
# 使  用: exit_fw 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
exit_fw() {
  local serial="$1"
  
  adb -s "${serial}" shell am force-stop com.cyjh.gundam
}
