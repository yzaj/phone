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
#       halt
#       unlock
#       apk
#       screencap
#       bootloader
#       recovery
#       start_tl
#       update_tl
#       exit_tl
#       start_fw
#       use_fw
#       run_fw
#       exit_fw
#       play
#       blue
#       white
#       left_lower
#       left_top
#       right_lower
#       right_center
#       click
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

# 功  能: 关机
# 使  用: halt 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
halt() {
  local serial="$1"
  
  adb -s "${serial}" shell reboot -p
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

# 功  能: 覆盖安装 *.apk
# 使  用: apk 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 1.apk ~ 9.apk, 允许文件不存在
apk() {
  local serial="$1"
  local drive='c'
  local dir
  local i
  
  if [[ -f "/cygdrive/d/yzaj/cygwin64/Cygwin-Terminal.ico" ]]; then
    drive='d'
  fi
  
  dir="/cygdrive/${drive}/.yzaj/apk"
  
  mkdir -p "${dir}"
  
  cd "${dir}"
  
  for i in $(seq 9); do
    if [[ -f "${i}.apk" ]]; then
      echo "install ${i}.apk ..."
      adb -s "${serial}" install -r "${i}.apk"
      sleep 1
    fi
  done
}

# 功  能: 截屏并保存到计算机
# 使  用: screencap 手机序列号 手机型号 手机编号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 
# 参数 3: 手机编号    [default: ]
# 返回值: 
# 备  注: 
screencap() {
  local serial="$1"
  local num="$3"
  local drive='c'
  local dir
  
  if [[ -f "/cygdrive/d/yzaj/cygwin64/Cygwin-Terminal.ico" ]]; then
    drive='d'
  fi
  
  dir="/cygdrive/${drive}/.yzaj/screencap"
  
  mkdir -p "${dir}"
  
  adb -s "${serial}" exec-out screencap -p > "${dir}/${num}.png"
}

# 功  能: 重启并进入 fastboot 模式, 线刷
# 使  用: bootloader 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
bootloader() {
  local serial="$1"
  
  adb -s "${serial}" reboot bootloader
}

# 功  能: 重启并进入 recovery 模式
# 使  用: recovery 手机序列号
# 参数 1: 手机序列号    [default: ]
# 返回值: 
# 备  注: 
recovery() {
  local serial="$1"
  
  adb -s "${serial}" reboot recovery
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

# 功  能: 开始玩吧
# 使  用: play 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 点击 运行
play() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 1460 855
    return
  fi
  
  adb -s "${serial}" shell input tap 990 570
}

# 功  能: 开始蓝吧
# 使  用: blue 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 点击 右边蓝色框
blue() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 1360 915
    return
  fi
  
  adb -s "${serial}" shell input tap 950 615
}

# 功  能: 开始白吧
# 使  用: white 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 点击 向下方向键
white() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" ]]; then
    adb -s "${serial}" shell input tap 965 1125
    return
  fi
  
  if [[ "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 965 1110
    return
  fi
  
  adb -s "${serial}" shell input tap 635 765
}

# 功  能: 点击 左下角
# 使  用: left_lower 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 红点, 黄点
left_lower() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 15 1010
    return
  fi
  
  adb -s "${serial}" shell input tap 8 670
}

# 功  能: 点击 左上角
# 使  用: left_top 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 切换
left_top() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 960 710
    adb -s "${serial}" shell input tap 1780 135
    
    for i in $(seq 3); do
      adb -s "${serial}" shell input tap 1030 855
    done
    
    adb -s "${serial}" shell input tap 80 80
    return
  fi
  
  adb -s "${serial}" shell input tap 720 475
  adb -s "${serial}" shell input tap 1265 90
  
  for i in $(seq 3); do
    adb -s "${serial}" shell input tap 720 570
  done
  
  adb -s "${serial}" shell input tap 55 55
}

# 功  能: 点击 右下角
# 使  用: right_lower 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 红点, 黄点
right_lower() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" ]]; then
    adb -s "${serial}" shell input tap 2075 1010
    return
  fi
  
  if [[ "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 1900 1010
    return
  fi
  
  adb -s "${serial}" shell input tap 1375 670
}

# 功  能: 点击 右中间
# 使  用: right_center 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 红点, 黄点
right_center() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" ]]; then
    adb -s "${serial}" shell input tap 2075 540
    return
  fi
  
  if [[ "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 1900 540
    return
  fi
  
  adb -s "${serial}" shell input tap 1375 355
}

# 功  能: 横屏时, 点击屏幕安全区域
# 使  用: click 手机序列号 手机型号
# 参数 1: 手机序列号    [default: ]
# 参数 2: 手机型号    [default: ]
# 返回值: 
# 备  注: 
click() {
  local serial="$1"
  local model="$2"
  
  if [[ "${model}" == "xiaomi6x" || "${model}" == "xiaominote" ]]; then
    adb -s "${serial}" shell input tap 695 55
    return
  fi
  
  #adb -s "${serial}" shell input tap 530 35
  adb -s "${serial}" shell input tap 100 670
  adb -s "${serial}" shell input tap 100 670
}
