#!/bin/bash
#
# 初始化
set -euo pipefail

#### 常量 ####
# 重启 adb 服务端的间隔时间: 分钟
readonly INTERVAL_TIME=180
readonly E_NOT_FOUND=3

#### 函数 ####

#### 变量 ####
readonly phonestart="${tempdir}/.phonestart"
starttime=0
currenttime="$(date '+%s')"
intervaltime="$((INTERVAL_TIME * 60))"
readonly currenttime
readonly intervaltime

#### 主体 ####
if ! type adb; then
  err "Command not found"
  exit "${E_NOT_FOUND}"
fi

if [[ -s "${phonestart}" ]]; then
  starttime="$(cat "${phonestart}")"
fi

if (((currenttime - starttime) > intervaltime)); then
  adb kill-server  || true
  sleep 3
  adb start-server || true
  sleep 3
  echo "${currenttime}" > "${phonestart}"
fi
