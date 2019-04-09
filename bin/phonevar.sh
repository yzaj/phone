#!/bin/bash
#
# 常量与变量
set -euo pipefail

# 常量

# 变量
end_num=134
interval_time=180

readonly bindir="${ROOTDIR}/phone/bin"
readonly confdir="${ROOTDIR}/phone/conf"
readonly tempdir="${ROOTDIR}/temp/phone"

todaydir="${tempdir}/log/$(date +'%Y-%m-%d')"
beforedir="${tempdir}/log/$(date +'%Y-%m-%d' -d '-7day')"
phonelog="${todaydir}/$(date +'%H-%M-%S').log"

readonly todaydir
readonly beforedir
readonly phonelog
