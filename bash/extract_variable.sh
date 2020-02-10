#!/bin/bash

source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/util/deco___@___.sh
source /home/oracle/rr/tool/replace_ascii_to_space.sh
source /home/oracle/rr/func/msg/msg_func.sh

_arg_prc(){
  ARGS="$*"
  SRC_FNM=$(echo "${ARGS}" | tr ' ' '\n')
  _fin_msg "${FUNCNAME}"
}

_mk_variable_liz(){
  SRC_DIR=$1
  fg_red ${SRC_DIR}
  VAR_LIZ=$(echo "${SRC_DIR}" | while read F;do
    [ -f "${F}" ] && continue
    local CMD="grep -r -E \"([A-Z]{1,}[_]{0,}){1,}\" "${F}"" 
    while read REZ;do
      local SRC_FNM=$(pwd)/"${REZ%:*}"
      local VAR_NM="${REZ#*:}"
      echo "${SRC_FNM}"":""${VAR_NM}"
    done < <(eval "${CMD}")
  done)
  fg_green "${VAR_LIZ}"
  echo "${VAR_LIZ}" | sed -e 's/:/\t/g' -e 's/\//_/g' > ${TMP_DIR}/t
  _fin_msg "${FUNCNAME}"
}

_extract_file_contents(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
    sed -i -E 's/.*\t//g' "${F}"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_remove_lower_alp(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
     sed -i -E 's/[a-z]{1,}//g' "${F}"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_remove_num(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
     sed -i -E 's/[0-9]{1,}//g' "${F}"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_mk_tmpdir(){
  TMP_DIR=$(mktemp -d)
  fg_red ${TMP_DIR}
  _fin_msg "${FUNCNAME}"
}

_clean_tmpdir(){
  rm -rf ${TMP_DIR}
  _fin_msg "${FUNCNAME}"
}

_clean_variable_result(){
  rm -rf $(pwd)/tool/*split*
  _fin_msg "${FUNCNAME}"
}

_split(){
  local SRC_FILE=$1
  local TGT_FILE=$2
  cat ${SRC_FILE} | awk '
  BEGIN{
    TGT_FILE="'${TGT_FILE}'"
  }
  {
    print > TGT_FILE"_split_"$1
  }
  '
}

_call_replace_ascii_to_space(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
     _replace_ascii_to_space "${F}"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_extract_variable(){
  SRC_DIR=$1
  VAR_LIZ=$(echo "${SRC_DIR}" | while read F;do
    local CMD="grep -r -E \"([A-Z]{1,}[_]{0,}){1,}\" "${F}"" 
    while read REZ;do
      local SRC_FNM=$(pwd)/"${REZ%:*}"
      local VAR_NM="${REZ#*:}"
      echo "${SRC_FNM}"":""${VAR_NM}"
    done < <(eval "${CMD}")
  done)
  fg_green "${VAR_LIZ}"
  echo "${VAR_LIZ}" | sed -e 's/:/\t/g' -e 's/\//_/g' > ${TMP_DIR}/t
  _fin_msg "${FUNCNAME}"
}

_remove_head_under_score(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
     sed -i -e 's/_\{1,\}$//g' "${F}"
     fg_yellow "$(cat "${F}")"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_remove_tail_under_score(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
     sed -i -e 's/^_\{1,\}//g' "${F}"
     fg_yellow "$(cat "${F}")"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_remove_blank_line(){
  local SRC_DIR=$1
  fg_red ${SRC_DIR}
  while read F;do
     sed -i '/^$/d' "${F}"
     fg_yellow "$(cat "${F}")"
  done < <(find "${SRC_DIR}" -type f -name "*split*")
  _fin_msg "${FUNCNAME}"
}

_count_variable(){
  local SRC_DIR=$1
  local TGT_FNM="$(pwd)/tool/count_var"
  fg_red ${SRC_DIR}
  cat "${SRC_DIR}"/*split* | sort | uniq -c | sort -n -k 1 | tac >${TGT_FNM}
  _fin_msg "${FUNCNAME}"
}

_main(){
  ARG="$*"
  _clean_variable_result
  _arg_prc "${ARG}"
  _mk_variable_liz "${SRC_FNM}"
  _split "${TMP_DIR}/t" "${TMP_DIR}/t"
  _remove_lower_alp "${TMP_DIR}"
  _remove_num "${TMP_DIR}"
  _extract_file_contents "${TMP_DIR}"
  _call_replace_ascii_to_space "${TMP_DIR}"
  _remove_head_under_score "${TMP_DIR}"
  _remove_tail_under_score "${TMP_DIR}"
  _remove_blank_line "${TMP_DIR}"
  _count_variable "${TMP_DIR}"
  _fin_msg "${FUNCNAME}"
}

_mk_tmpdir
_main $*
_clean_tmpdir
