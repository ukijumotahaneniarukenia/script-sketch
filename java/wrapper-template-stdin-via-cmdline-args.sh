#!/usr/bin/env bash

usage(){

cat <<EOS

Usage:

  CMD: ${0##*/} test.xml test.xsd

EOS

exit 0

}

INPUT_FILE_NAME=$1;shift;
OUTPUT_FILE_NAME=$1;shift;

if [ -z $INPUT_FILE_NAME ];then

  usage

fi

if [ -z $OUTPUT_FILE_NAME ];then

  usage

fi

java -jar JARFILE_FULL_PATH $INPUT_FILE_NAME $OUTPUT_FILE_NAME
