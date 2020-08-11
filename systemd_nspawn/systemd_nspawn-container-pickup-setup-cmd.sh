#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  CMD: $0 001
EOS

exit 0

}

MACHINE_NO=$1;shift;

if [ -z $MACHINE_NO ];then

  usage

fi

if [[ $(echo $MACHINE_NO | bc ) -eq 0 ]];then

  usage

fi

WAIT_TIME=2.5
INPUT_FILE_NAME=systemd_nspawn-container-listup-setup-cmd.sh
OUTPUT_FILE_NAME=systemd_nspawn-container-execute-setup-cmd.sh

rm -rf $OUTPUT_FILE_NAME

touch $OUTPUT_FILE_NAME

chmod 755 $OUTPUT_FILE_NAME

cat $INPUT_FILE_NAME | grep $MACHINE_NO | while read c;do echo $c; echo "sleep $WAIT_TIME";done >>$OUTPUT_FILE_NAME
