#!/bin/bash

source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/util/deco___@___.sh
source /home/oracle/rr/func/msg/msg_func.sh

_extract_except_func(){
  START_STR=$1
  END_STR=$2
  FILE_NM=$3
  GET_START_RN_CMD="sed -n '/${START_STR}/=' ${FILE_NM} | tail -n 1"
  GET_END_RN_CMD="sed -n '/${END_STR}/=' ${FILE_NM} | tail -n 1"
  START_RN=$(($(eval "${GET_START_RN_CMD}")+1))
  END_RN=$(eval "${GET_END_RN_CMD}")
  _fin_msg "${FUNCNAME}"
}

_build_cmd(){
  START_RN=$1
  END_RN=$2
  FILE_NM=$3
  BUILD_CMD="sed -i -n '""${START_RN}"",""${END_RN}""p""'"" ${FILE_NM}"
  _fin_msg "${FUNCNAME}"
}

_exec_cmd(){
  BUILD_CMD=$1
  eval "${BUILD_CMD}"
  _fin_msg "${FUNCNAME}"
}

_delete_blank_row(){
  FILE_NM=$1
  sed -i '/^$/d' ${FILE_NM}
  _fin_msg "${FUNCNAME}"
}

_insert_shebang(){
  FILE_NM=$1
  sed -i '1i#!/bin/bash\n' ${FILE_NM}
  _fin_msg "${FUNCNAME}"
}

_insert_footstamp(){
  FILE_NM=$1
  sed -i '3isource footstamp\n' ${FILE_NM}
  _fin_msg "${FUNCNAME}"
}

_fetch_test_func_number(){
  FILE_NM=$1
  local TMP="${FILE_NM#*#}"
  POST_REPLACE_STR="$(pwd)/test/invokee/*""${TMP%%_*}""*"
  _fin_msg "${FUNCNAME}"
}

_replace_footstamp(){
  FILE_NM=$1
  POST_REPLACE_STR=$2
  POST_REPLACE_FILE=$(echo "" | awk '
  BEGIN{
    POST_REPLACE_STR="'${POST_REPLACE_STR}'"
  }
  {
    gsub(/footstamp/,POST_REPLACE_STR);
    print
  }' "${FILE_NM}")
  echo "${POST_REPLACE_FILE}" > "${FILE_NM}"
  _fin_msg "${FUNCNAME}"
}

_extract_test_code(){
  COPY_LIZ=$1
  while read LIZ;do
    local TGT_FNM="${LIZ#*:}"
    _extract_except_func '}' '$' ${TGT_FNM}
    _build_cmd ${START_RN} ${END_RN} ${TGT_FNM}
    _exec_cmd "${BUILD_CMD}"
    _delete_blank_row ${TGT_FNM}
    _insert_shebang ${TGT_FNM}
    _insert_footstamp ${TGT_FNM}
    _fetch_test_func_number ${TGT_FNM}
    _replace_footstamp ${TGT_FNM} "${POST_REPLACE_STR}"
  done < <(echo "${COPY_LIZ}")
  _fin_msg "${FUNCNAME}"
}

_mk_tmpdir(){
  TMP_DIR=$(mktemp -d)
  _fin_msg "${FUNCNAME}"
}

_clean_tmpdir(){
  rm -rf ${TMP_DIR}
  _fin_msg "${FUNCNAME}"
}

_clean_test_code(){
  rm -rf $(pwd)/test/invoker/_test*
  _fin_msg "${FUNCNAME}"
}

_arg_prc(){
  ARGS="$*"
  fg_green "${ARGS}"
  SRC_FNM=$(echo "${ARGS}" | tr ' ' '\n')
  fg_green "${SRC_FNM}"
  _fin_msg "${FUNCNAME}"
}

_mk_copy_liz(){
  local SRC_FNM=$1
  fg_green "${SRC_FNM}"
  COPY_LIZ=$(echo "${SRC_FNM}" | while read F;do
    local CMD="grep -r \"^_.*)\s*{\" "${F}" | sed -e 's/(){//g'" 
    while read REZ;do
      local SRC_FNM=$(pwd)/"${REZ%:*}"
      local TMP_FNM=$(pwd)/"${REZ%:*}"
      local TGT_FNM="${TMP_FNM//invokee/invoker}"
      echo "${SRC_FNM}"":""${TGT_FNM}"
    done < <(eval "${CMD}")
  done)
  _fin_msg "${FUNCNAME}"
}

_copy_test_file(){
  local COPY_LIZ=$1
  while read LIZ;do
    local SRC_FNM="${LIZ%:*}"
    local TGT_FNM="${LIZ#*:}"
    cp "${SRC_FNM}" "${TGT_FNM}"
  done < <(echo "${COPY_LIZ}")
  _fin_msg "${FUNCNAME}"
}

_main(){
  ARGS="$*"
  _clean_test_code
  _arg_prc "${ARGS}"
  _mk_copy_liz "${SRC_FNM}"
  _copy_test_file "${COPY_LIZ}"
  _extract_test_code "${COPY_LIZ}"
  _fin_msg "${FUNCNAME}"
}

_mk_tmpdir
_main $*
_clean_tmpdir
