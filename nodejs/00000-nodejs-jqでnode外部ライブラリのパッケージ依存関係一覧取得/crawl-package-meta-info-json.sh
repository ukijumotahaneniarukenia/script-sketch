#!/usr/bin/env bash

usage(){

cat <<EOS

Usage

CMD: time ${0##*/} url-list.txt &

EOS

exit 0

}

INPUT_FILE_NAME=$1;shift;

if [ -z $INPUT_FILE_NAME ];then

  usage

fi

if [ ! -f $INPUT_FILE_NAME ];then

  usage

fi

mkdir -p output
mkdir -p log

OUTPUT_DIR_NAME=output
LOG_DIR_NAME=log

LOG_SUCCESS_FILE_NAME=$LOG_DIR_NAME/url-list-success-$(date "+%Y-%m-%d").log
LOG_FAILURE_FILE_NAME=$LOG_DIR_NAME/url-list-failure-$(date "+%Y-%m-%d").log

exec 1>$LOG_SUCCESS_FILE_NAME
exec 2>$LOG_FAILURE_FILE_NAME

cat $INPUT_FILE_NAME | \

  while read url;do

    echo $url

    OUTPUT_FILE_NAME=$(echo $url| sed -r 's;https://registry.npmjs.org/;;g' | sed -r 's;/\?json;;g' | sed -r 's;/;-;g')

    curl -fsSL $url -o - | jq '' >$OUTPUT_DIR_NAME/$OUTPUT_FILE_NAME-$(date "+%Y-%m-%dT%H-%M-%S").json

    sleep $[RANDOM%10]

done
