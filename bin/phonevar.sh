#!/bin/bash
#
# 常量与变量
set -euo pipefail

# 常量 - 退出状态码
readonly E_MISSING_OPERAND=1
readonly E_UNRECOGNIZED_OPTION=2
readonly E_NOT_FOUND=127

# 变量 - phone.conf
end_num=134
interval_time=180

# 变量 - phone.sh
readonly bindir="${ROOTDIR}/phone/bin"
readonly confdir="${ROOTDIR}/phone/conf"
readonly tempdir="${ROOTDIR}/temp/phone"

todaydir="${tempdir}/log/$(date +'%Y-%m-%d')"
beforedir="${tempdir}/log/$(date +'%Y-%m-%d' -d '-7day')"
phonelog="${todaydir}/$(date +'%H-%M-%S').log"

readonly todaydir
readonly beforedir
readonly phonelog

# 变量 - phonearg.sh
phonenums=''
phonecmds=''

# 变量 - phoneinit.sh
readonly phonestart="${tempdir}/.phonestart"

start_time=0
current_time="$(date '+%s')"

readonly current_time

# 变量 - phonemain.sh
phonedevice="${tempdir}/phone.device"
