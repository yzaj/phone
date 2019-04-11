#!/bin/bash
#
# 主程序
set -euo pipefail

. "${bindir}"/phonelist.sh
. "${bindir}"/phonefunc.sh
. "${bindir}"/phonecmd.sh
. "${bindir}"/phonearg.sh
. "${bindir}"/phoneinit.sh

if [[ -s "${phonedevice}" ]]; then
  rm "${phonedevice}"
fi














