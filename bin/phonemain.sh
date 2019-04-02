#!/bin/bash
#
# 控制手机
set -euo pipefail

#### 常量 ####

##############
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

#### 包含 ####
. "${confdir}"/phone.conf

#### 函数 ####

#### 变量 ####

#### 主体 ####
