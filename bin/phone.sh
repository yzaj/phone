#!/bin/bash
#
# 控制手机的 log
set -euo pipefail

readonly ROOTDIR='/yzaj'
readonly bindir="${ROOTDIR}/phone/bin"
readonly confdir="${ROOTDIR}/phone/conf"
readonly tempdir="${ROOTDIR}/temp/phone"
todaydir="${tempdir}/log/$(date +'%Y-%m-%d')"
beforedir="${tempdir}/log/$(date +'%Y-%m-%d' -d '-7day')"
readonly todaydir
readonly beforedir
phonelog="${todaydir}/$(date +'%H-%M-%S').log"
readonly phonelog

if [[ -d "${beforedir}" ]]; then
  rm -r "${beforedir}"
fi

mkdir -p "${todaydir}"

. "${bindir}"/phonemain.sh 2>&1 | tee "${phonelog}"
