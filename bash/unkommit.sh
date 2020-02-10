#!/bin/bash

NORMAL=$(tput sgr0)
FG_GREEN=$(tput setaf 2)
FG_YELLOW=$(tput setaf 3)
FG_CYAN=$(tput setaf 6)
FG_WHITE=$(tput setaf 7)

_fg_green(){
  echo -ne "${FG_GREEN}$*${NORMAL}"
}

_fg_yellow(){
  echo -ne "${FG_YELLOW}$*${NORMAL}"
}

_fg_white(){
  echo -ne "${FG_WHITE}$*${NORMAL}"
}

_fg_cyan(){
  echo -ne "${FG_CYAN}$*${NORMAL}"
}

_embeded_lf(){
  printf "%s\n" ""
}

_info_msg(){
  local STR="$1"
  _fg_green "$(printf "INFO--->%s\n" ${STR})"
}

_err_msg(){
  local STR="$1"
  _fg_cyan "$(printf "ERROR!--->%s\n" ${STR})"
}

_notify_non_tgt(){
  _info_msg "NON_STAGING_TARGET_FILE!" && _embeded_lf
}

_show_usage(){
  _info_msg "UNKO_EMOJI_UNICODE_IS_\\\U1F4A9_""$(echo -e '\U1F4A9')" && _embeded_lf
  _fg_white "$(cat <<EOF
BELOW IS OK_PATTERN AND NG_PATTERN.PLEASE REFER."$(echo -e '\U1F601')"
THIS IS OK_PATTERN. Enable Any CodePoint of Unicode Except '\\\U1F4A9'.
ex.) '\\\U1F47B'"$(echo -e '\U1F47B')" is ghost.
===============================================================
unkommit '\\\U1F4A9' '\\\U1F47B'
unkommit '\\\U1F47B' '\\\U1F4A9'
unkommit '\\\U1F4A9' '\\\U1F4A9'
THIS IS NG_PATTERN. None Any One '\\\U1F4A9'.
===============================================================
unkommit '\\\U1F47B' '\\\U1F47B'
EOF
)" && _embeded_lf
}

_cancel(){
  _embeded_lf && _info_msg "PROCESS_HAS_BEEN_CANCLED..." && _embeded_lf && exit
}

_cancle_handle(){
  trap '_cancel' 2
}

_pre_proccess(){
  git fetch && git merge origin/master
}

_confirm(){
  local MARK_LFT="$1";shift
  local MARK_RGT="$1";shift
  paste -d '' <(_mk_commit_sni) <(_mk_commit_msg "${MARK_LFT}" "${MARK_RGT}")
  _fg_cyan "$(cat <<EOF
===============================================================
TRY TO COMMIT WHIT THIS COMMIT MESSAGE.
ACCEPT??
===============================================================
EOF
)" && _embeded_lf

while :; do
  _fg_yellow "Please Enter y/n)" && read JDG
  case ${JDG} in
    y)ACCEPT=1 && return;;
    n)_fg_yellow "TryAgain." && _embeded_lf && exit;;
    *):;;
  esac
done
}

_exec_commit(){
  eval "$(paste -d '' <(_mk_commit_sni) <(_mk_commit_msg "${MARK_LFT}" "${MARK_RGT}"))" && return
}

_unkommit(){
  _cancle_handle
  _pre_proccess
  [ $? -ne 0 ] && _err_msg "Error_Git_Fetch.Please_Confirm_Logs.$(echo -e '\U1F47B')" && _embeded_lf 
  local MARK_LFT="$1";shift
  local MARK_RGT="$1";shift
  ([ -z ${MARK_LFT} ] || [ -z ${MARK_RGT} ]) && \
    { _err_msg "FUNCTION:${FUNCNAME}";_embeded_lf;_err_msg "PLEASE_MUST_ENTER_TWO_EMOJI_UNICODE.";_embeded_lf; } && \
    _show_usage && exit
  ([ ${MARK_LFT} != '\U1F4A9' ] && [ ${MARK_RGT} != '\U1F4A9' ]) && \
    { _err_msg "FUNCTION:${FUNCNAME}";_embeded_lf;_err_msg "OUT_OF_UNKO.PLEASE_ENTER_LEAST_A_UNKO_EMOJI_UNICODE.";_embeded_lf; } && \
    _show_usage && exit
  _confirm "${MARK_LFT}" "${MARK_RGT}"
  [ ${ACCEPT} -eq 1 ] && _exec_commit
  [ $? -eq 0 ] && _info_msg "Success_Unkommit!!!$(echo -e '\U1F4A9')" && _embeded_lf 
  [ $? -ne 0 ] && _err_msg "Error_Unkommit!!!Please_Confirm_Logs.$(echo -e '\U1F4A9')" && _embeded_lf 
}

_list_up(){
  local FILE_LIST=$(git status|sed 's/ /#/g'|awk '/rename|mod|new|del/{print}'|sed 's/.*#//g'|while read F;do echo "${F}";done)
  echo "${FILE_LIST}"
}

_mk_commit_sni(){
  while read ENTRY;do
    echo "echo git commit "${ENTRY}" -m "\""\""|bash
  done < <(_list_up)
}

_list_cnt(){
  _list_up | wc -l
}

_mk_commit_msg(){
  local MARK_LFT="$1"
  local MARK_RGT="$2"
  _mk_commit_msg_upper "${MARK_LFT}" "${MARK_RGT}"
  _mk_commit_msg_lower "${MARK_LFT}" "${MARK_RGT}"
}

_mk_commit_msg_upper(){
  local LFT="$1";shift
  local RGT="$1";shift
  local MARK_LFT="$(echo -e "${LFT}")"
  local MARK_RGT="$(echo -e "${RGT}")"
  local CNT=$(_list_cnt)
  [ ${CNT} -eq 0 ] && _notify_non_tgt && exit
  while read MARK_RGT;do
    echo "\"""$(_deco_ful_pdy $(_list_cnt) "${MARK_LFT}" $(eval echo "${MARK_RGT}"))""\""
  done < <( _non_tac_slope_str "${MARK_RGT}" 1 $((${CNT}/2)))
}

_mk_commit_msg_lower(){
  local LFT="$1";shift
  local RGT="$1";shift
  local MARK_LFT="$(echo -e "${LFT}")"
  local MARK_RGT="$(echo -e "${RGT}")"
  local CNT=$(_list_cnt)
  [ ${CNT} -eq 0 ] && _notify_non_tgt && exit
  while read MARK_RGT;do
    echo "\"""$(_deco_ful_pdy $(_list_cnt) "${MARK_LFT}" $(eval echo "${MARK_RGT}"))""\""
  done < <( _tac_slope_str "${MARK_RGT}" 1  $((${CNT}/2)))
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

_non_tac_slope_str(){
  local STR="$1";shift
  local START="$1";shift
  local END="$1";shift
  while read RN;do
    TMP=$(printf "%$((RN==1?1:RN))s" "@");
    REP=$(echo "${TMP}" | sed -e 's/ /@/g');
    echo "'"${REP//@/${STR}}"'";
  done < <(seq ${START} ${END})
}

_tac_slope_str(){
  local STR="$1";shift
  local START="$1";shift
  local END="$1";shift
  while read RN;do
    TMP=$(printf "%$((RN==1?1:RN))s" "@");
    REP=$(echo "${TMP}" | sed -e 's/ /@/g');
    echo "'"${REP//@/${STR}}"'";
  done < <(seq ${START} ${END} | tac)
}

_unkommit "$@"
