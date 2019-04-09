#!/bin/bash
#
# 控制手机
set -euo pipefail

#### 常量 ####
readonly ROOTDIR='/yzaj'

#### 包含 ####
. "${ROOTDIR}"/phone/bin/phonevar.sh
. "${ROOTDIR}"/shell/lib/filedir.sh

#### 函数 ####
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

#### 变量 ####

#### 主体 ####
# 读取配置文件
filedir::config "end_num" "[1-2][0-9][0-9]" "${confdir}/phone.conf"
filedir::config "interval_time" "[0-9]{1,}" "${confdir}/phone.conf"

readonly end_num
readonly interval_time

# 创建 log
if [[ -d "${beforedir}" ]]; then
  rm -r "${beforedir}"
fi

mkdir -p "${todaydir}"

. "${bindir}"/phonemain.sh 2>&1 | tee "${phonelog}"
























































#### 常量 ####
readonly ROOTDIR='/yzaj'

#### 包含 ####
. "${ROOTDIR}"/phone/bin/phonevar.sh
. "${ROOTDIR}"/shell/lib/filedir.sh

#### 函数 ####
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

#### 变量 ####

#### 主体 ####

























#### 常量 ####
readonly ROOTDIR='/yzaj'

#### 函数 ####
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

#### 变量 ####
readonly bindir="${ROOTDIR}/phone/bin"
readonly confdir="${ROOTDIR}/phone/conf"
readonly tempdir="${ROOTDIR}/temp/phone"
todaydir="${tempdir}/log/$(date +'%Y-%m-%d')"
beforedir="${tempdir}/log/$(date +'%Y-%m-%d' -d '-7day')"
readonly todaydir
readonly beforedir
phonelog="${todaydir}/$(date +'%H-%M-%S').log"
readonly phonelog

#### 主体 ####
if [[ -d "${beforedir}" ]]; then
  rm -r "${beforedir}"
fi

mkdir -p "${todaydir}"

. "${bindir}"/phonemain.sh 2>&1 | tee "${phonelog}"
