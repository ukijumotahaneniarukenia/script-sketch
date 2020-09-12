#!/usr/bin/env bash

usage(){
cat <<EOS

Usage:

CMD: bash ${0##*/} wrksp App-darwin-x64

EOS

exit 0
}

PROJECT_DIR_NAME=$1;shift;
APP_DIR_NAME=$1;shift;

if [ -z $PROJECT_DIR_NAME ];then

  usage

fi

if [ -z $APP_DIR_NAME ];then

  usage

fi

WRKSP_DIR_NAME=$HOME/script-sketch/electron

cd $WRKSP_DIR_NAME/$PROJECT_DIR_NAME

ls -lh | awk '$9 ~ /\./ && $9 !~ /.md$/ {print $9}' | grep -v packaging.sh | xargs rm -rf

zip -r $APP_DIR_NAME.zip $APP_DIR_NAME

tar -zcvf $APP_DIR_NAME.tar.gz $APP_DIR_NAME

tar -jcvf $APP_DIR_NAME.tar.bz2 $APP_DIR_NAME

tar -Jcvf $APP_DIR_NAME.tar.xz $APP_DIR_NAME

tar -cvf $APP_DIR_NAME.tar $APP_DIR_NAME
