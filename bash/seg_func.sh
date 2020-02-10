#!/bin/bash

source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/util/deco___@___.sh
source /home/oracle/rr/func/msg/msg_func.sh

_build_cmd(){
  START_RN=$1
  END_RN=$2
  FILE_NM=$3
  BUILD_CMD="sed -i -n '""${START_RN}"",""${END_RN}""p""'"" ${FILE_NM}"
  _fin_msg "${FUNCNAME}"
}

_first_filter(){
  START_STR=$1
  END_STR=$2
  FILE_NM=$3
  GET_START_RN_CMD="sed -n '/${START_STR}/=' ${FILE_NM} | head -n 1"
  GET_END_RN_CMD="sed -n '/${END_STR}/=' ${FILE_NM} | tail -n 1"
  START_RN=$(eval "${GET_START_RN_CMD}")
  END_RN=$(eval "${GET_END_RN_CMD}")
  _fin_msg "${FUNCNAME}"
}

_second_filter(){
  START_STR=$1
  END_STR=$2
  FILE_NM=$3
  GET_START_RN_CMD="sed -n '/${START_STR}/=' ${FILE_NM} | head -n 1"
  GET_END_RN_CMD="sed -n '/${END_STR}/=' ${FILE_NM} | head -n 1"
  START_RN=$(eval "${GET_START_RN_CMD}")
  END_RN=$(eval "${GET_END_RN_CMD}")
  _fin_msg "${FUNCNAME}"
}

_exec_cmd(){
  BUILD_CMD=$1
  eval "${BUILD_CMD}"
  _fin_msg "${FUNCNAME}"
}

_insert_shebang(){
  FILE_NM=$1
  sed -i '1i#!/bin/bash\n' ${FILE_NM}
  _fin_msg "${FUNCNAME}"
}

_main(){
  START_STR=$1
  END_STR=$2
  FNM=$3
  _first_filter ${START_STR} ${END_STR} ${FNM} 
  _build_cmd ${START_RN} ${END_RN} ${FNM}
  _exec_cmd "${BUILD_CMD}"
  _second_filter ${START_STR} ${END_STR} ${FNM} 
  _build_cmd ${START_RN} ${END_RN} ${FNM}
  _exec_cmd "${BUILD_CMD}"
  _insert_shebang ${FNM}
  _fin_msg "${FUNCNAME}"
}

_main $1 $2 $3
