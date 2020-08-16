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

  STR=${ARGS[0]}

  if [ -z "${STR}" ] ;then

    usage

  fi

  echo "${STR}" | CMD_STR

}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || usage
