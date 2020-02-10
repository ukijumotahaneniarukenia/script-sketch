#!/bin/bash

_def_global_var(){
  SLF_DIR=$( cd $(dirname $0);pwd; )
  SLF_FNM=$(basename $0 )
  set -- "$@"
  declare -a ARGV=()
  declare -a ARGC=0
  ARGS=("[$@]")
}

_parse_long_option(){
  fg_green "${FUNCNAME}""_is_called."
}

_parse_short_option(){
  fg_green "${FUNCNAME}""_is_called."
}

_parse_real_args(){
  fg_green "${FUNCNAME}""_is_called."
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
 echo UNKOMORIMORI
}

_main(){
  _def_global_var
  _import
  #for i in ${!ARGS[@]};do
  #  _pre_process "${ARGS[$i]}"
  #  case "${ARGS[$i]}" in
  #    --*)echo -ne "${ARGS[$i]}";echo -ne "=======>";fg_yellow "long_option";;
  #        #_parse_long_option "${ARGS[$i]}"
  #    -*)echo -ne "${ARGS[$i]}";echo -ne "=======>";fg_cyan "short_option";;
  #        #_parse_short_option "${ARGS[$i]}"
  #    *)echo -ne "${ARGS[$i]}";echo -ne "=======>";fg_white "arg_proc";;
  #        #_parse_real_args "${ARGS[$i]}"
  #  esac
  #  shift
  #done 
}

_main "$@"
