#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
   IN: echo INPUT_STR | ${0##*/}
  OUT: OUTPUT_STR
EOS

exit 0

}

main(){
  ARGS=($(cat -));

  if [[ 0 -eq ${#ARGS[@]} ]] ;then

    usage

  fi

  for(( i=0;i<${#ARGS[@]};i++ ));do

    echo ${ARGS[$i]} | CMD_STR

  done

}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || usage
