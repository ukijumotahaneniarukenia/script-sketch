#!/usr/bin/env bash

usage(){

cat <<EOS

Usage:

LOCALE:

       a ar
       b bg by
       c ca ca-CAT cs-CZ
       d da-DK de de-AT de-CH
       e ee en en-AU en-BORK en-CA en-GB en-IND en-MS en-NEP en-NG en-NZ en-PAK en-SG en-UG en-US en-ZA en-au-ocker es es-MX
       f fa fi-FI fr fr-CA fr-CH
       h he hu hy
       i id in-ID it
       j ja
       k ko
       l lv
       n nb-NO nl no-NO
       p pl pt pt-BR
       r ru
       s sk sv sv-SE
       t th tr
       u uk
       v vi
       z zh-CN zh-TW

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
