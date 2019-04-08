#!/bin/bash
#
# 常量与变量
set -euo pipefail

# 常量 - 文件与目录
readonly ROOTDIR='/yzaj'

# 变量 - 文件与目录
readonly bindir="${ROOTDIR}/phone/bin"
readonly confdir="${ROOTDIR}/phone/conf"
readonly tempdir="${ROOTDIR}/temp/phone"



























#### 变量 ####

todaydir="${tempdir}/log/$(date +'%Y-%m-%d')"
beforedir="${tempdir}/log/$(date +'%Y-%m-%d' -d '-7day')"
readonly todaydir
readonly beforedir
phonelog="${todaydir}/$(date +'%H-%M-%S').log"
readonly phonelog
