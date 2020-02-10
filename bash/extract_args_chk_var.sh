#!/bin/bash

source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/util/deco___@___.sh
source /home/oracle/rr/func/msg/msg_func.sh

_def_global_variable(){
  __ERROR_CNT=0
  _fin_msg "${FUNCNAME}"
}

_build_cmd(){
  START_RN=$1
  END_RN=$2
  FILE_NM=$3
  BUILD_CMD="sed -n '""${START_RN}"",""${END_RN}""p""'"" ${FILE_NM}"
  fg_green "${BUILD_CMD}"
  _fin_msg "${FUNCNAME}"
}

_first_filter(){
  START_STR=$1
  END_STR=$2
  FILE_NM=$3
  __TMP_ERROR_CNT=0
  GET_START_RN_CMD="sed -n '/${START_STR}/=' ${FILE_NM} | head -n 1"
  GET_END_RN_CMD="sed -n '/${END_STR}/=' ${FILE_NM} | head -n 1"
  START_RN=$(eval "${GET_START_RN_CMD}")
  END_RN=$(eval "${GET_END_RN_CMD}")
  fg_white "${START_RN}"
  fg_white "${END_RN}"
  ( [ -n "${START_RN}" ] || [ -n "${END_RN}" ]) || __TMP_ERROR_CNT=$((__TMP_ERROR_CNT+1)) 
  _fin_msg "${FUNCNAME}"
}

_exec_cmd(){
  BUILD_CMD=$1
  eval "${BUILD_CMD}" || __ERROR_CNT=$((__ERROR_CNT+1))
  _fin_msg "${FUNCNAME}"
}

_main(){
  START_STR=$1
  END_STR=$2
  TGT_DIR=$3
  _def_global_variable
  while read FNM;do
    fg_magenta "${FNM}"
    _first_filter ${START_STR} ${END_STR} ${FNM} 
    [ ${__TMP_ERROR_CNT} -ne 0 ] && _err_msg "There_are_errors.continue." && continue
    _build_cmd ${START_RN} ${END_RN} ${FNM}
    _exec_cmd "${BUILD_CMD}"
  done < <(find ${TGT_DIR} -type f -name "*")
  [ ${__ERROR_CNT} -ne 0 ] && _err_msg "There_are_errors."
  _fin_msg "${FUNCNAME}"
}

_main $1 $2 $3
