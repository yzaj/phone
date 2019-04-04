#!/bin/bash
#
# 控制手机的初始化
set -euo pipefail

#### 常量 ####
readonly E_NOT_FOUND=3

#### 函数 ####

#### 变量 ####

#### 主体 ####
if ! type adb; then
  err "Command not found"
  exit "${E_NOT_FOUND}"
fi










