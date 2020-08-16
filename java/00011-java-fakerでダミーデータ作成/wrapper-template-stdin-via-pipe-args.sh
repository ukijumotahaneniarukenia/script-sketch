#!/usr/bin/env bash

usage(){

cat <<EOS

Usage:

  CMD: echo TOBE_REPLACE_INPUT_ARGS | ${0##*/}

EOS

exit 0

}

main(){
  ARGS=($(cat -));

  if [[ 0 -eq ${#ARGS[@]} ]] ;then

    usage

  fi

  echo ${ARGS[@]} | java -jar TOBE_REPLACE_JARFILE_FULL_PATH

}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || usage
