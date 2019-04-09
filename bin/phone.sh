#!/bin/bash
#
# 控制手机
set -euo pipefail

#### 常量 ####
readonly ROOTDIR='/yzaj'

#### 包含 ####
. "${ROOTDIR}"/phone/bin/phonevar.sh

#### 函数 ####

#### 变量 ####

#### 主体 ####

































































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
