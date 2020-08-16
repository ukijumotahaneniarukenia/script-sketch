#!/usr/bin/env bash

usage(){

cat <<EOS

Usage:

  CMD: bash ${0##*/} wrapper-template-stdin-via-pipe-args.sh 'ja 10'

EOS

exit 0

}

PROJECT_DIR_PREFIX_NO=00011

WRAPPER_TEMPLATE_FILE_NAME=$1;shift;

INPUT_ARGS=$1;shift;

LANG_NAME=java

if [ -z "$INPUT_ARGS" ];then

  usage

fi

if [ -z $WRAPPER_TEMPLATE_FILE_NAME ];then

  usage

fi

APP_NAME=faker

INSTALL_DIR_NAME=$HOME/script-cmd/java/11/$APP_NAME

rm -rf $INSTALL_DIR_NAME

mkdir -p $INSTALL_DIR_NAME

find $HOME/script-sketch/$LANG_NAME/$PROJECT_DIR_PREFIX_NO* -type f | grep jar$ | grep with-dependencies | \

  while read INSTALL_FILE_NAME;do

    APP_NAME=$(echo ${INSTALL_FILE_NAME##*/} | grep -Po '.*?(?=-[0-9])' | sed 's/^/faker-/')

    #テンプレートファイルのコピー
    cp $WRAPPER_TEMPLATE_FILE_NAME $INSTALL_DIR_NAME/

    #置換
    sed -i -r "s;TOBE_REPLACE_JARFILE_FULL_PATH;$INSTALL_FILE_NAME;g" $INSTALL_DIR_NAME/$WRAPPER_TEMPLATE_FILE_NAME

    #置換
    sed -i -r "s;TOBE_REPLACE_INPUT_ARGS;$INPUT_ARGS;g" $INSTALL_DIR_NAME/$WRAPPER_TEMPLATE_FILE_NAME

    #リネーム
    mv $INSTALL_DIR_NAME/$WRAPPER_TEMPLATE_FILE_NAME $INSTALL_DIR_NAME/$APP_NAME-$LANG_NAME

  done
