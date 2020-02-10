#!/bin/bash

_def_global_var(){
  SLF_DIR=$( cd $(dirname $0);pwd; )
  SLF_FNM=$(basename $0 )
}

_import(){
  TGT_DIR="${1:-}"
  while read TGT_FNM;do
    while read TGT_FNM;do
      source "${TGT_FNM}"
    done < <(cat "${TGT_FNM}" | grep -vE "#|^$|${SLF_DIR}/${SLF_FNM}") 
  done < <(find $(pwd)/import/"${TGT_DIR}" -type f -name "*order*")
  _fin_msg "${FUNCNAME}"
}

_dcr_args(){
  declare -i argc=0
  declare -a argv=()
}

_mk_tmp_dir(){
  TMP_DIR=$(mktemp -d)
  _fin_msg "${FUNCNAME}"
}

_mk_oput_dir(){
  mkdir -p $(pwd)/test/{invoker,invokee}
  _fin_msg "${FUNCNAME}"
}

_pre_process(){
  ARGS="$@"
  fg_white "${ARGS}"
  ARGS="${ARGS//\[/}"
  ARGS="${ARGS//\]/}"
  fg_cyan "${ARGS}"
  fg_green "${FUNCNAME}""_is_called."
}

_usage(){
 case "$1" in
   1)fg_white "${NON_ARGS_ERR}";;
   *)fg_white "UNKOMORIMORI"echo -ne "\U1F4A9";;
 esac
}

_parse_args(){
  ARGS="$@"
  fg_green "${ARGS}"
  [ ${!ARGS[@]} -eq 0 ] && _usage 1 && exit
  for i in ${!ARGS[@]};do
    _pre_process "${ARGS[$i]}"
    case "${ARGS[$i]}" in
      --*)echo -ne "${ARGS[$i]}";echo -ne "=======>";fg_yellow "long_option";;
          #_parse_long_option "${ARGS[$i]}"
      -*)echo -ne "${ARGS[$i]}";echo -ne "=======>";fg_cyan "short_option";;
          #_parse_short_option "${ARGS[$i]}"
      *)echo -ne "${ARGS[$i]}";echo -ne "=======>";fg_white "arg_proc";;
          #_parse_real_args "${ARGS[$i]}"
    esac
    shift
  done 
 
  #while [ -z "${ARGS}" ];do
  #  echo "${ARGS}"
  #  shift
  #done
  #SRC_FNM=$(echo "${ARGS}" | tr ' ' '\n')
  #fg_white "${SRC_FNM}"
  #echo "$(pwd)/${SRC_FNM}"
  #while read ARG;do
  #  echo "===========""${ARG}"
  #done < <(echo "$(pwd)/${SRC_FNM}")
  _fin_msg "${FUNCNAME}"
}

_clean_test(){
  rm -rf $(pwd)/test/invokee/_test*
  _fin_msg "${FUNCNAME}"
}

_clean_dynamic_cmd(){
  rm -f $(pwd)/tool/dyn*
  _fin_msg "${FUNCNAME}"
}

_mk_rutine_liz(){
  _clean_test
  local __TEST_GRP=0
  local __TEST_SEQ=0
  SRC_FNM=$1
  RUTINE_LIZ=$(echo "${SRC_FNM}" | while read F;do
    local CMD="grep -r \"^_.*)\s*{\" "${F}" | sed -e 's/(){//g'" 
    while read REZ;do
      local SRC_FNM=$(pwd)/"${REZ%:*}"
      local RUTINE_NM="${REZ#*:}"
      PTY_RUTINE_NM=$(_deco_ful_pdy 1 30 '_' "${RUTINE_NM}")
      [ "${PRE_SRC_FNM}" != "${SRC_FNM}" ] && __TEST_GRP=$((__TEST_GRP + 1)) && __TEST_SEQ=0
      __TEST_SEQ=$((__TEST_SEQ + 1))
      local PRE_SRC_FNM="${SRC_FNM}"
      local TGT_FNM="_test""___#"$(printf "%02g" ${__TEST_GRP})"-"$(printf "%02g" ${__TEST_SEQ})""${PTY_RUTINE_NM}""$(sed -e 's:/:_:g' <<<${SRC_FNM})
      echo "${RUTINE_NM}"":""${TGT_FNM}"
    done < <(eval "${CMD}")
  done)
  _fin_msg "${FUNCNAME}"
}

_mk_copy_liz(){
  _clean_test
  local __TEST_GRP=0
  local __TEST_SEQ=0
  SRC_FNM=$1
  COPY_LIZ=$(echo "${SRC_FNM}" | while read F;do
    local CMD="grep -r \"^_.*)\s*{\" "${F}" | sed -e 's/(){//g'" 
    while read REZ;do
      local SRC_FNM=$(pwd)/"${REZ%:*}"
      local RUTINE_NM="${REZ#*:}"
      PTY_RUTINE_NM=$(_deco_ful_pdy 1 30 '_' "${RUTINE_NM}")
      [ "${PRE_SRC_FNM}" != "${SRC_FNM}" ] && __TEST_GRP=$((__TEST_GRP + 1)) && __TEST_SEQ=0
      __TEST_SEQ=$((__TEST_SEQ + 1))
      local PRE_SRC_FNM="${SRC_FNM}"
      local TGT_FNM="_test""___#"$(printf "%02g" ${__TEST_GRP})"-"$(printf "%02g" ${__TEST_SEQ})""${PTY_RUTINE_NM}""$(sed -e 's:/:_:g' <<<${SRC_FNM})
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
    cp "${SRC_FNM}" $(pwd)/test/invokee/"${TGT_FNM}"
  done < <(echo "${COPY_LIZ}")
  _fin_msg "${FUNCNAME}"
}


_clean_tmpdir(){
  rm -rf ${TMP_DIR}
  _fin_msg "${FUNCNAME}"
}

_include(){
  local FNM=$1
  shift
  local ARG="$*"
  source ${FNM} "${ARG}"
  _fin_msg "${FUNCNAME}"
}

_build_dynamic_cmd(){
  local RUTINE_LIZ=$1
  TMP_DIR=$2
  while read LIZ;do
    SRC_FNM="${LIZ#*:}"
    local RUTINE_NM="${LIZ%:*}"
    DYN_CMD_FNM="./tool/dynamic_cmd"
    echo "" | awk '
    BEGIN{ 
      RUTINE_NM="'${RUTINE_NM}'"
      SRC_FNM="'${SRC_FNM}'"
      TMP_DIR="'${TMP_DIR}'"
      CALL_FUNC_FNM="./tool/seg_func.sh"
      SPA="\'${SPA}'"
      LCB="\'${LCB}'"
      RCB="\'${RCB}'"
      DQT="\'${DQT}'"
      LPS="\'${LPS}'"
      RPS="\'${RPS}'"
      CLT="\'${CLT}'"
      DOT="\'${DOT}'"
      SLS="\'${SLS}'"
      ARG1=DQT""RUTINE_NM""LPS""RPS""LCB""DQT
      ARG2=DQT""CLT""RCB""DQT
      ARG3=DQT""TMP_DIR""SLS""SRC_FNM""DQT
    }
    {
      print CALL_FUNC_FNM""SPA""ARG1""SPA""ARG2""SPA""ARG3
    }' >> "${DYN_CMD_FNM}"
  done < <(echo "${RUTINE_LIZ}")
  _fin_msg "${FUNCNAME}"
}

_exec_dynamic_cmd(){
  CMD_FNM=$1
  while read CMD;do
    eval "${CMD}"
  done < <(cat ${CMD_FNM})
  _fin_msg "${FUNCNAME}"
}


_copy_test_file_to_tmpdir(){
  RUTINE_LIZ=$1
  while read LIZ;do
    FNM="${LIZ#*:}"
    SRC=$(pwd)/test/invokee/${FNM}
    TGT=${TMP_DIR}/${FNM}
    cp ${SRC} ${TGT}
  done < <(echo "${RUTINE_LIZ}")
  _fin_msg "${FUNCNAME}"
}

_copy_segregate_result(){
  RUTINE_LIZ=$1
  while read LIZ;do
    FNM="${LIZ#*:}"
    SRC=$(pwd)/test/invokee/${FNM}
    TGT=${TMP_DIR}/${FNM}
    cp ${TGT} ${SRC}
  done < <(echo "${RUTINE_LIZ}")
  _fin_msg "${FUNCNAME}"
}

_handle_exit_code(){
  [ $? -ne 0 ] && fg_red "____________________FAIL_______________________" && exit
  [ $? -eq 1 ] && fg_green "____________________SUCCESS_______________________"
}

_main(){
  ARGS="$@"
  _def_global_var
  _import
  _clean_test
  _mk_tmp_dir
  _mk_oput_dir
  _parse_args "${ARGS}"
  #_mk_rutine_liz "${SRC_FNM}"
  #_mk_copy_liz "${SRC_FNM}"
  #_copy_test_file "${COPY_LIZ}"
  #_include ./tool/ascii_code.sh
  #_clean_dynamic_cmd
  #_build_dynamic_cmd "${RUTINE_LIZ}" "${TMP_DIR}"
  #_copy_test_file_to_tmpdir "${RUTINE_LIZ}"
  #_exec_dynamic_cmd "${DYN_CMD_FNM}"
  #_copy_segregate_result "${RUTINE_LIZ}"
  #_clean_tmpdir
  #_clean_dynamic_cmd
  #_fin_msg "${FUNCNAME}"
  #_handle_exit_code
}

_main "$@"
