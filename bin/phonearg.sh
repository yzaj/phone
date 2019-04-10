#!/bin/bash
#
# 参数
set -euo pipefail

# 范例: phone.sh all 101-118 121-124 128 130 reboot,sleep:30,vol-up

if (($# < 2)); then
  err_mo
fi

for phonearg in "$@"; do
  # 获取所有的 all 参数
  if [[ "${phonearg}" == "all" ]]; then
    phonenum="$(seq 101 "${end_num}")"
    get_nums
  
  # 获取所有形如 101-118 的参数
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]-[1-2][0-9][0-9]$ ]]; then
    phonearg_head="${phonearg%-*}"
    phonearg_tail="${phonearg#*-}"
    
    if ((101 <= phonearg_head)) && ((phonearg_head < phonearg_tail)) && ((phonearg_tail <= end_num)); then
      phonenum="$(seq "${phonearg_head}" "${phonearg_tail}")"
      get_nums
    else
      err_uo
    fi
  
  # 获取所有形如 101 的参数
  elif [[ "${phonearg}" =~ ^[1-2][0-9][0-9]$ ]] && ((101 <= phonearg)) && ((phonearg <= end_num)); then
    phonenum="${phonearg}"
    get_nums
  
  # 获取最后一次输入的命令组
  elif [[ "${phonearg}" =~ ^[A-Za-z][A-Za-z0-9,:-]*[A-Za-z0-9,]$ ]]; then
    phonecmds="${phonearg//,/ }"
    phonecmds="${phonecmds//-/_}"
    
    for phonecmd in ${phonecmds}; do
      if [[ "$(type -t "${phonecmd}")" == "function" ]] && grep -P "^#[ \t]*${phonecmd}[ \t]*$" "${bindir}"/phonecmd.sh; then
        :
      elif [[ "${phonecmd}" =~ ^sleep:[0-9]{1,}$ ]]; then
        :
      else
        err_uo
      fi
    done
  
  # 否则
  else
    err_uo
  fi
done

if [[ -z "${phonenums}" || -z "${phonecmds}" ]]; then
  err_mo
fi

phonenums="$(echo -e "${phonenums}" | sort -nu | xargs)"
readonly phonenums
readonly phonecmds
