#!/usr/bin/env bash

usage(){

cat <<EOS

Usage:

  CMD: echo TOBE_REPLACE_INPUT_FILE_NAME | ${0##*/}

EOS

exit 0

}

INPUT_FILE_NAME=$1;shift;

if [ -z $INPUT_FILE_NAME ];then

  usage

fi

echo $INPUT_FILE_NAME | java -jar TOBE_REPLACE_JARFILE_FULL_PATH