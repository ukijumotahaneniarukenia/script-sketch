#!/bin/bash

source $(pwd)/tool/ascii_code.sh
source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/util/deco___@___.sh
source /home/oracle/rr/func/msg/msg_func.sh

_arg_prc(){
  [ -z "${@}" ] && { _err_msg "FUNCTION:${FUNCNAME}";_err_msg "ARGS_IS_EMPTY."; } | tee ${LOG_DIR}/${0##*/}"###"[${FUNCNAME}]"###"$(date +%Y-%m%d-%H:%M:%S).error_log && exit
  : @@@START_VARIABLE@@@
  local ARGS="$@"
  : @@@END_VARIABLE@@@
  fg_green "${ARGS}"
  local OLD_IFS="${IFS}"
  local IFS=
  local ARGS_ON_LF=$(tr ',' '\n' <<<"${ARGS}")
  fg_yellow "${ARGS_ON_LF}"
  local IFS="${OLD_IFS}"
  echo "${ARGS_ON_LF}" > ${TMP_DIR}/cmd_cnv
  fg_white "$(cat "${TMP_DIR}/cmd_cnv")"
  _fin_msg "${FUNCNAME}"
}

_remove_lf(){
  [ -z "${@}" ] && { _err_msg "FUNCTION:${FUNCNAME}";_err_msg "ARGS_IS_EMPTY."; } | tee ${LOG_DIR}/${0##*/}"###"[${FUNCNAME}]"###"$(date +%Y-%m%d-%H:%M:%S).error_log && exit
  : @@@START_VARIABLE@@@
  local FILE="$@"
  : @@@END_VARIABLE@@@
  fg_green "$(cat "${FILE}")"
  sed -i ':a;N;$!ba;s/\n/\t/g' "${FILE}"
  fg_yellow "$(cat "${FILE}")"
  _fin_msg "${FUNCNAME}"
}

_def_global_variable(){
  : @@@START_VARIABLE@@@
  LOG_DIR=$(pwd)/logs
  : @@@END_VARIABLE@@@
  fg_yellow ${LOG_DIR}
  _fin_msg "${FUNCNAME}"
}

_mk_tmpdir(){
  TMP_DIR=$(mktemp -d)
  fg_yellow ${TMP_DIR}
  _fin_msg "${FUNCNAME}"
}

_clean_tmpdir(){
  rm -rf ${TMP_DIR}
  _fin_msg "${FUNCNAME}"
}

_trap_with_exit(){
  trap '_clean_tmpdir' EXIT
  _fin_msg "${FUNCNAME}"
}

_replace_ascii_to_code(){
  [ -z "${@}" ] && { _err_msg "FUNCTION:${FUNCNAME}";_err_msg "ARGS_IS_EMPTY.PLEASE_CONFIRM_ERROR_LOG."; } | tee ${LOG_DIR}/${0##*/}"###"[${FUNCNAME}]"###"$(date +%Y-%m%d-%H:%M:%S).error_log && exit
  [ "${#}" -eq 0 ] && { _err_msg "FUNCTION:${FUNCNAME}";_err_msg "ARGS_CNT:${#}"; } | tee ${LOG_DIR}/${0##*/}"###"[${FUNCNAME}]"###"$(date +%Y-%m%d-%H:%M:%S).error_log && exit 
  local ARGS="$@"
  fg_green "$(cat "${TMP_DIR}/cmd_cnv")"
  local TMP_FILE=$(awk '
  {
      if(NR>=3)gsub(/\x20/,"\\x20")
      if(NR>=3)gsub(/\x22/,"\\x22")
      if(NR>=3)gsub(/\x5c\x24/,"\\x24")
      if(NR>=3)gsub(/\x5c\x28/,"\\x28")
      if(NR>=3)gsub(/\x5c\x29/,"\\x29")
      if(NR>=3)gsub(/\x5c\x5b/,"\x5c\\x5b")
      if(NR>=3)gsub(/\x7b/,"\\x7b")
      if(NR>=3)gsub(/\x7d/,"\\x7d")
      print
  }
  ' "${TMP_DIR}/cmd_cnv") 
  echo "${TMP_FILE}" > ${TMP_DIR}/cmd_cnv
  fg_white "$(cat "${TMP_DIR}/cmd_cnv")"
  _fin_msg "${FUNCNAME}"
}

_replace_target_file_list_up(){
  local CMD_FILE="$1"
  TGT_FILE_LIST=$(cat "${CMD_FILE}" | awk -F'\t' '
  {
    TGT_DIR=$1
    SEARCH_STR=$2
    PRE_REPLACE_STR=$3
    POST_REPLACE_STR=$4
    CMD = sprintf("grep -r \x27%s\x27 \x27%s\x27",SEARCH_STR , TGT_DIR);
    #print CMD
    system(CMD)
    close(CMD)
  }
  ' | sed 's/:.*//g' | sort | uniq)
  fg_white "${TGT_FILE_LIST}"
  _fin_msg "${FUNCNAME}"
}

_exec_replace(){
  local TGT_FILE_LIST="$1";shift
  local CMD_FILE="$1";shift
  ([ -z "${TGT_FILE_LIST}" ] || [ -z "${CMD_FILE}" ]) && { _err_msg "FUNCTION:${FUNCNAME}";_err_msg "ARGS_IS_EMPTY."; } | tee ${LOG_DIR}/${0##*/}"###"[${FUNCNAME}]"###"$(date +%Y-%m%d-%H:%M:%S).error_log && exit
  while read F;do
    cat "${CMD_FILE}" | awk -F'\t' '
    BEGIN{
      TGT_FILE="'${F}'"
    }
    {
      
      SEARCH_STR=$3
      PRE_REPLACE_STR=$3
      POST_REPLACE_STR=$4
      CMD = sprintf("sed -i \x27/%s/s/%s/%s/g\x27 %s",SEARCH_STR,PRE_REPLACE_STR , POST_REPLACE_STR, TGT_FILE);
      print CMD
      system(CMD)
      close(CMD)
    }
    '
  done < <(echo "${TGT_FILE_LIST}")
  _fin_msg "${FUNCNAME}"
}

_main(){
  local ARGS="$@"
  _trap_with_exit
  _def_global_variable
  _mk_tmpdir
  _arg_prc "${ARGS}"
  _replace_ascii_to_code "${TMP_DIR}/cmd_cnv" 
  _remove_lf "${TMP_DIR}/cmd_cnv"
  _replace_target_file_list_up "${TMP_DIR}/cmd_cnv"
  _exec_replace "${TGT_FILE_LIST}" "${TMP_DIR}/cmd_cnv" 
  _fin_msg "${FUNCNAME}"
}

_main "$@"
