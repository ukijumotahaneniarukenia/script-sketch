#!/bin/bash

<<TODO
===============================================================
multibyte handling

===============================================================
TODO
_row_number(){
  mx_seq=$1;shift
  by_grp=$1;shift
  [ -z $mx_seq ] && echo 対象数いれて && exit 1
  [ -z $by_grp ] && echo 集約単位いれて && exit 1
  while read rn mod;do
    mod=$(eval echo $mod)
    [ $mod -eq 0 ] && mod=$by_grp
    grp=0
    [ $mod -eq 1 ] && grp=$((grp+1))
    echo $rn $mod $grp 
  done < <(seq $mx_seq | xargs -I@ bash -c 'echo @ "$\(\(@%\$by_grp\)\)"') | awk 'BEGIN{sum=0}{sum+=$3;print sum" "$1" "$2" "$3}'
}

#_row_number 22 10 | awk '{print "#site-pager-ele-"$2" {grid-row: "$1" / "$1+1";grid-column: "$3" / "$3+1" #;background-color: #000000;}"}'


_def_global_var(){
  SLF_DIR=$( cd $(dirname $0);pwd; )
  SLF_FNM=$(basename $0 )
  DEBUG=
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

_show_err_msg(){
  MSG_STR="$1"
  case "${MSG_STR}" in
    OVER_STRLEN_ERR_MSG)
       _err_msg "${OVER_STRLEN_ERR_MSG}";; 
    NON_ARGS_ERR_MSG)
       _err_msg "${NON_ARGS_ERR_MSG}";; 
    NOTIFY_ERR_MSG)
       _err_msg "${NOTIFY_ERR_MSG}";; 
    *)
       fg_white "UNKOMORIMORI";;
  esac
  _fin_msg "${FUNCNAME}"
}

_usage(){
  MSG_CODE="$1";shift
  MSG_STR="$1";shift
  case "${MSG_CODE}" in
    0)_show_info_msg "${MSG_STR}";;
    1)_show_err_msg "${MSG_STR}";;
    2)_show_warn_msg "${MSG_STR}";;
    3)_show_start_msg "${MSG_STR}";;
    4)_show_end_msg "${MSG_STR}";;
    *)
      fg_white "UNKOMORIMORI";;
  esac
  _fin_msg "${FUNCNAME}"
}

_deco_ful_pdy(){
  local MX_PAD="$1";shift
  local SHAPE="$1";shift
  local STR="$1";shift
  local PAD=$(bc <<< ${MX_PAD}-${#STR})
  local PADHLF=$(bc <<< ${PAD}/2)
  local IS_EVEN=$(bc <<< ${PAD}%2)
  local LN=$(echo ""|awk '
  {
    PADHLF="'${PADHLF}'"
    SHAPE="'${SHAPE}'"
    while(PADHLF-- >0)printf(SHAPE)
  }')
  [ ${IS_EVEN} -eq 1 ] && echo "${LN}${STR}${LN}"
  [ ${IS_EVEN} -ne 1 ] && echo "${LN}${STR}${LN:2}"
}

_tac_slope_str(){
  local STR="$1";shift
  local START="$1";shift
  local END="$1";shift
  #[ ${#STR} -ne 1 ] && _usage "${ERR_CODE}" "${ERR_MSG_002}" && return
  while read RN;do
    TMP=$(printf "%$((RN==1?1:RN))s" "${STR}")
    echo "${TMP}"
  done < <(seq ${START} ${END} | tac)
  #_fin_msg "${FUNCNAME}"
}

_non_tac_slope_str(){
  local STR="$1";shift
  local START="$1";shift
  local END="$1";shift
  #[ ${#STR} -ne 1 ] && _usage "${ERR_CODE}" "${ERR_MSG_002}" && return
  while read RN;do
    TMP=$(printf "%$((RN==1?1:RN))s" "${STR}")
    echo "${TMP}"
  done < <(seq ${START} ${END})
  #_fin_msg "${FUNCNAME}"
}

_tac_rgt_trg_str(){
  local STR="$1";shift
  local START="$1";shift
  local END="$1";shift
  echo "${STR}"
  echo "${START}"
  echo "${END}"
  #[ ${#STR} -ne 1 ] && _usage "${ERR_CODE}" "${ERR_MSG_002}" && return
  while read RN;do
    TMP=$(printf "%$((RN==1?1:RN))s" "${STR}")
  #  REP=$(echo "${TMP}" | sed -e "s/ /${STR}/g")
  #  echo "${REP}"
    echo "${TMP}"
    echo "${RN}"
  done < <(seq ${START} ${END} | tac)
  #_fin_msg "${FUNCNAME}"
}

_non_tac_rgt_trg_str(){
  local STR="$1";shift
  local START="$1";shift
  local END="$1";shift
  #[ ${#STR} -ne 1 ] && _usage "${ERR_CODE}" "${ERR_MSG_002}" && return
  while read RN;do
    TMP=$(printf "%$((RN==1?1:RN))s" "${STR}")
    REP=$(echo "${TMP}" | sed -e "s/ /${STR}/g")
    echo "${REP}"
  done < <(seq ${START} ${END})
  #_fin_msg "${FUNCNAME}"
}

_rev(){
  STR="$@"
  echo "" | awk '
    function _rev(STR,START_LEN){
      REDUCE_STR=REDUCE_STR""substr(STR,START_LEN,1)
      print REDUCE_STR
      if (START_LEN == 1) exit 0
      return (_rev(STR,START_LEN - 1))
    }
    BEGIN{
      STR="'${STR}'"
    }
    {
      _rev(STR,length(STR))
    }
    END{
      
    }
  ' | tail -n 1
  _fin_msg "${FUNCNAME}"
}

_flow(){
  _def_global_var
  _import
  #_non_tac_slope_str "$@"
  #_tac_slope_str "$@"
  _non_tac_rgt_trg_str "$@"
  _tac_rgt_trg_str "$@"
  #_rev "ainekurainenahatomujiku"
  _fin_msg "${FUNCNAME}"
}

_main(){
  _flow "$@"
  [ $? -ne 0 ] && _usage "${ERR_CODE}" "${ERR_MSG_000}" && exit 1
}

#_main "#" 1  12

_call_dynamic_cmd(){
  while read cmd;do
    eval ${cmd};
  done < <(cat $(pwd)/test/oput/mk_dynamic_cmd);
}

_cmd_clean(){
  rm -rf $(pwd)/test/{tmp,oput}/*
}

_grp(){
  local RN="$1";shift
  local GRP="$1";shift
  while read LINE;do
     echo ${LINE} | sed -e s/GRP/${GRP}/ | bash
     #echo ${LINE} | sed -e s/GRP/${GRP}/ | bash;
  done < <(seq ${RN} | xargs -I@ bash -c 'echo echo $\(\(@%GRP\)\)')
}

#_grp 10 3

#_join(){
#  local LFT=$1
#  local RGT=$2
#  local TGT_FNM=$3
#  paste -d ' ' ${LFT} ${RGT} > ${TGT_FNM}
#}

_split(){
  local SRC_FNM="$1";shift
  local TGT_FNM="$1";shift
  cat ${SRC_FNM} | awk '
  BEGIN{
    TGT_FNM="'${TGT_FNM}'"
  }
  {
    print > TGT_FNM"_split_"$1
  }
  '
}

_replica_cmd(){
  local LINE_START=$1
  local LINE_END=$2
  local SRC_FNM=$3
  local TGT_FNM=$4
  seq ${LINE_START} ${LINE_END} | while read RN;do
    cat ${SRC_FNM}
  done > ${TGT_FNM}
}

_sort_cmd_with_str(){
  local SORT_KEY=$1
  local SRC_FNM=$2
  local TGT_FNM=$3
  sort -k ${SORT_KEY},${SORT_KEY} ${SRC_FNM} >> ${TGT_FNM}
}

_sort_cmd_with_numkey(){
  local SORT_KEY=$1
  local SRC_FNM=$2
  local TGT_FNM=$3
  sort -n -k ${SORT_KEY},${SORT_KEY} ${SRC_FNM} >> ${TGT_FNM}
}

_replace_cmd(){
  local LINE_START=$1
  local LINE_END=$2
  local TGT_FNM=$3
  while read F;do
    cat ${F} | nl | awk '
    BEGIN{
    }
    {
      print $3"\x20"$1"\x20"$5"\x20"$6;
    }
    '
  done < <((find $(pwd)/test/tmp -type f -name "*split*")) > ${TGT_FNM}
}

_grp_rn(){
  local LINE_START=$1
  local LINE_END=$2
  local REPLICA=$3
  local ZERO_PAD=$4
  local PLAIN_FILE=$(pwd)/test/tmp/mk_dynamic_cmd
  local POSTREPLICA_FILE=$(pwd)/test/tmp/mk_postreplica_dynamic_cmd
  local POSTSORT_FILE=$(pwd)/test/tmp/mk_postsort_dynamic_cmd
  local GRPTMP_FILE=$(pwd)/test/tmp/grptmp
  local POSTGRP_FILE=$(pwd)/test/tmp/mk_postgrp_dynamic_cmd
  local POSTREPLACE_FILE=$(pwd)/test/tmp/mk_postreplace_dynamic_cmd
  local OPUT_FILE=$(pwd)/test/oput/mk_dynamic_cmd
  _replica_cmd ${LINE_START} ${LINE_END} ${PLAIN_FILE} ${POSTREPLICA_FILE}
  _sort_cmd_with_str ${ZERO_PAD} ${POSTREPLICA_FILE} ${POSTSORT_FILE}
  printf "%0${ZERO_PAD}g\n" $(_grp $(cat ${POSTSORT_FILE} | wc -l) $(($(cat ${POSTSORT_FILE} | wc -l)/${REPLICA}))) | sort > ${GRPTMP_FILE}
  _join ${GRPTMP_FILE} ${POSTSORT_FILE} ${POSTGRP_FILE}
  _split ${POSTGRP_FILE} ${POSTGRP_FILE}
  _replace_cmd  ${LINE_START} ${LINE_END} ${POSTREPLACE_FILE}
  cp ${POSTREPLACE_FILE} ${OPUT_FILE}
}

_mk_decopd_dynamic_cmd_non_tac(){
  local LINE_START=$1
  local LINE_END=$2
  local MX_PAD=$3
  local CMD=$4
  local SHAPE=$5
  local STR=$6
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      MX_PAD="'${MX_PAD}'"
      CMD="'${CMD}'"
      SHAPE="'${SHAPE}'"
      STR="'${STR}'"
    }
    {
      print CMD"\x20"RN"\x20"MX_PAD"\x20\x27"STR"\x27\x20\x27"SHAPE"\x27"
    }
    '
  done < <(seq ${LINE_START} ${LINE_END}) >> $(pwd)/test/oput/mk_dynamic_cmd
}

_mk_decopd_dynamic_cmd_tac(){
  local LINE_START=$1
  local LINE_END=$2
  local MX_PAD=$3
  local CMD=$4
  local SHAPE=$5
  local STR=$6
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      MX_PAD="'${MX_PAD}'"
      CMD="'${CMD}'"
      SHAPE="'${SHAPE}'"
      STR="'${STR}'"
    }
    {
      print CMD"\x20"RN"\x20"MX_PAD"\x20\x27"STR"\x27\x20\x27"SHAPE"\x27"
    }
    '
  done < <(seq ${LINE_START} ${LINE_END} | tac) >> $(pwd)/test/oput/mk_dynamic_cmd
}

_mk_pd_dynamic_cmd_tac(){
  local LINE_START=$1
  local LINE_END=$2
  local CMD=$3
  local STR=$4
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      CMD="'${CMD}'"
      STR="'${STR}'"
    }
    {
      print CMD"\x20"RN"\x20\x27"STR"\x27"
    }
    '
  done < <(seq ${LINE_START} ${LINE_END} | tac) >> $(pwd)/test/oput/mk_dynamic_cmd
}

_mk_pd_dynamic_cmd_non_tac(){
  local LINE_START=$1
  local LINE_END=$2
  local CMD=$3
  local STR=$4
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      CMD="'${CMD}'"
      STR="'${STR}'"
    }
    {
      print CMD"\x20"RN"\x20\x27"STR"\x27"
    }
    '
  done < <(seq ${LINE_START} ${LINE_END}) >> $(pwd)/test/oput/mk_dynamic_cmd
}

_mk_ascii_dynamic_cmd(){
  local LINE_START=$1
  local LINE_END=$2
  local CMD=$3
  local STR=$4
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      CMD="'${CMD}'"
      STR="'${STR}'"
    }
    {
      SHAPE=sprintf("%c",strtonum(RN))
      print CMD"\x20""RNN""\x20\x27"SHAPE"\x27\x20\x27"STR"\x27"
    }
    '
  done < <(seq ${LINE_START} ${LINE_END}) >> $(pwd)/test/tmp/mk_dynamic_cmd
}

_mk_ascii_code_non_lf(){
  local LINE_START=$1
  local LINE_END=$2
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
    }
    {
      printf("\\x%x",strtonum(RN))
    }
    '
  done < <(seq ${LINE_START} ${LINE_END})
}

_mk_ascii_code(){
  local LINE_START=$1
  local LINE_END=$2
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
    }
    {
      printf("\\x%x\n",strtonum(RN))
    }
    '
  done < <(seq ${LINE_START} ${LINE_END})
}

_mk_ascii_char_non_lf(){
  local LINE_START=$1
  local LINE_END=$2
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
    }
    {
      printf("%c",strtonum(RN))
    }
    '
  done < <(seq ${LINE_START} ${LINE_END})
}

_mk_ascii_char(){
  local LINE_START=$1
  local LINE_END=$2
  while read RN;do
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
    }
    {
      SHAPE=sprintf("%c",strtonum(RN))
      print SHAPE
    }
    '
  done < <(seq ${LINE_START} ${LINE_END})
}

_mk_pd_tac_cmd(){
  STR=$1
  START=$2
  INTERVAL=$3
  END=$4
  DYN_CMD=$5
  PAD_CMD=$6
  REP_CMD=$7
  while read RN;do
    TMP=$( sed -e 's/ /@/g' <<<$(${REP_CMD} ${STR} ${START} ${INTERVAL} ${RN}))
    echo ${TMP}
    #TODO  --opiton -a -b -c
    #${DYN_CMD} ${START} ${RN} ${PAD_CMD} ${TMP##*@} 
    #${DYN_CMD} ${START} ${END} ${PAD_CMD} ${TMP##*@} 
    #${DYN_CMD} ${END} ${END} ${PAD_CMD} ${TMP##*@} 
  done < <(seq ${START} ${INTERVAL} ${END})
}

_find(){
  TGT_FNM="$1"
  [ -z "${TGT_FNM}" ] && echo -ne "PLEASE_ENTER_TGT_FNM!!!" && exit 1
  find $(pwd) -type f -name "*${TGT_FNM}*" 2>/dev/null
}


_mn(){
  IN="$@"
  echo "${IN}"
  #TODO minus_val is unsupported.
  awk '
    BEGIN{
      MN=9999999999999999999999999999
    }
    {
      if($1+0 < MN+0)MN=$1
    }
    END{
      printf("%f\n",MN)
    }
  ' <<<"$@"
}

_mx(){
  IN="$@"
  echo "${IN}"
  #TODO minus_val is unsupported.
  awk '
    BEGIN{
      MX=0
    }
    {
      if($1+0 > MX+0)MX=$1
    }
    END{
      printf("%f\n",MX)
    }
  ' <<<"$@"
}

_systime(){
  date '+%s'
}


_def_global_var
_import

#_tac_rgt_trg_str "$(fg_cyan "@")" 1 10
_tac_rgt_trg_str "@" 1 10
#fg_cyan "@"
#paste -d '' <(fg_cyan "$(_tac_rgt_trg_str "@" 1 10 )") <(_non_tac_rgt_trg_str "@" 1 10)
#_non_tac_rgt_trg_str "@" 1 10
#_tac_rgt_trg_str "@" 1 10

_join(){
  echo "$#"
  #eval "${LFT}"
  #while (($#>0));do
  #  #REDUCE=$(paste -d ' ' <(echo -ne "${REDUCE}") <(eval "$1"))
  #  REDUCE=$(paste -d ' ' <(echo -ne "${REDUCE}") <(eval "$1"))
  #  #echo "${REDUCE}"
  #  shift
  #done
  #echo "${REDUCE}"
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

_handle_with_exit(){
  trap '_clean_tmpdir' EXIT
  _fin_msg "${FUNCNAME}"
}

_listagg(){
  SRC_FNM="$1"
  PER_GRP='$1'
  DELIMITA='###'
  cat "${SRC_FNM}" | awk '
  {
    GRP_CLM["'${PER_GRP}'"]=GRP_CLM["'${PER_GRP}'"]DLT["'${PER_GRP}'"]$2;
    DLT["'${PER_GRP}'"]="'${DELIMITA}'"
    print '${PER_GRP}'"	"GRP_CLM["'${PER_GRP}'"]
  }
  END{
    #print $1"	"GRP_CLM[$1]
    #print GRP_CLM[f]
    #for(f in GRP_CLM)
  }
  '
}

#_clean_tmpdir
#_handle_with_exit
#_mk_tmpdir
#_listagg "$@" '$2'

_liz(){
  while [ -n "$1" ]; do
    [ -d "$1" ] && fg_white "$1" && _liz "$1"/*
    [ -d "$1" ] || fg_white "$1" && shift
  done
}

_lpd(){
  PD=$1
  STR=$2
  printf "%${PD}s\n" ${STR};
}

_rpd(){
  PD=$1
  STR=$2
  printf "|%-${PD}s|\n" ${STR};
}

_deco_ful_rev(){
  RPT=$1
  SHAPE=$2
  STR=$3
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "${STR}${LN}${STR}"
}

_deco_ful(){
  RPT=$1
  SHAPE=$2
  STR=$3
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "${LN}${STR}${LN}"
}


_deco_ful_pd(){
  RPT=$1
  MX_PAD=$2
  SHAPE=$3
  STR=$4
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "$(_lpd ${MX_PAD} ${LN})${STR}$(_rpd ${MX_PAD} ${LN})"
}

_deco_lft_lpd(){
  RPT=$1
  MX_PAD=$2
  SHAPE=$3
  STR=$4
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "$(_lpd ${MX_PAD} ${LN})${STR}"
}

_deco_lft(){
  RPT=$1
  SHAPE=$2
  STR=$3
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "${LN}${STR}"
}

_deco_rgt_rpd(){
  RPT=$1
  MX_PAD=$2
  SHAPE=$3
  STR=$4
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "${STR}$(_rpd ${MX_PAD} ${LN})"
}

_deco_rgt(){
  RPT=$1
  SHAPE=$2
  STR=$3
  LN=$(echo ""|awk '
  {
    RPT="'${RPT}'"
    SHAPE="'${SHAPE}'"
    while(RPT-- >0)printf(SHAPE)
  }')
  echo "${STR}${LN}"
}

_deco_rgty(){
  RPT=$1
  SHAPE=$2
  STR=$3
  PAD=$((${RPT}-${#STR}))
  LN=$(echo ""|awk '
  {
    PAD="'${PAD}'"
    SHAPE="'${SHAPE}'"
    while(PAD-- >0)printf(SHAPE)
  }')
  echo "${STR}${LN}"
}
