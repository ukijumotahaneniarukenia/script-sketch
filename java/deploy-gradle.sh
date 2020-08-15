#!/usr/bin/env bash

usage(){

cat <<EOS

Usage:

  CMD: ${0##*/} 00078 wrapper-template-stdin-via-pipe-args.sh

EOS

exit 0

}

PROJECT_DIR_PREFIX_NO=$1;shift;

WRAPPER_TEMPLATE_FILE_NAME=$1;shift;

LANG_NAME=java

if [ -z $PROJECT_DIR_PREFIX_NO ];then

  usage

fi

APP_NAME=$(find $PROJECT_DIR_PREFIX_NO* -type f | grep settings.gradle | xargs cat | grep -P 'rootProject\.name' | cut -d= -f2 | xargs)

INSTALL_DIR_NAME=$HOME/script-cmd/java/11/$APP_NAME/

mkdir -p $INSTALL_DIR_NAME

INSTALL_FILE_NAME=$(find $HOME/script-sketch/$LANG_NAME/$PROJECT_DIR_PREFIX_NO* -type f | grep jar$ | grep $APP_NAME)

#テンプレートファイルのコピー
cp $WRAPPER_TEMPLATE_FILE_NAME $INSTALL_DIR_NAME/

#置換
sed -i -r "s;JARFILE_FULL_PATH;$INSTALL_FILE_NAME;g" $INSTALL_DIR_NAME/$WRAPPER_TEMPLATE_FILE_NAME

#リネーム
mv $INSTALL_DIR_NAME/$WRAPPER_TEMPLATE_FILE_NAME $INSTALL_DIR_NAME/$APP_NAME-$LANG_NAME
