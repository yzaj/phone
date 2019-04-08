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
readonly shelllib="${ROOTDIR}/shell/lib"

todaydir="${tempdir}/log/$(date +'%Y-%m-%d')"
beforedir="${tempdir}/log/$(date +'%Y-%m-%d' -d '-7day')"
phonelog="${todaydir}/$(date +'%H-%M-%S').log"

readonly todaydir
readonly beforedir
readonly phonelog
