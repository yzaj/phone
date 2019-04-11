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

for phonecmd in ${phonecmds}; do
  if [[ "${phonecmd}" =~ ^sleep:[0-9]{1,}$ ]]; then
    phonecmd="${phonecmd//:/ }"
    echo "${phonecmd}"
    
    ${phonecmd}
    continue
  fi
  
  for phonenum in ${phonenums}; do
    :
  done
done










