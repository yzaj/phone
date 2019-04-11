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
    phoneserial="$(get_serial "${phonenum}")"
    phonemodel="$(get_model "${phonenum}")"
    
    if [[ -n "${phoneserial}" ]]; then
      phonestate="$(adb -s "${phoneserial}" get-state || true)"
      
      if [[ "${phonestate}" =~ ^device ]]; then
        echo "${phonecmd}    device:    ${phonenum}" | tee -a "${phonedevice}"
        
        ${phonecmd} "${phoneserial}" "${phonenum}" "${phonemodel}"
      else
        echo "${phonecmd}     error:    ${phonenum}" | tee -a "${phonedevice}"
      fi
    fi
  done
done










