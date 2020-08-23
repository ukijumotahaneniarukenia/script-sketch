#!/usr/bin/env bash
usage(){
cat <<EOS
Usage:
  CMD: bash ${0##*/} init 00099-jQuery-テンプレートプロジェクトの作成 app test-table.html

    or

  CMD: bash ${0##*/} build 00099-jQuery-テンプレートプロジェクトの作成 app

    or

  CMD: bash ${0##*/} deploy 00099-jQuery-テンプレートプロジェクトの作成 app

EOS

exit 0

}

init(){

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

  if [ -z $TEMPLATE_NAME ];then

    usage

  fi

  if [ -d $ROOT_DIR_NAME/$PROJECT_DIR_NAME ];then

    rm -rf $ROOT_DIR_NAME/$PROJECT_DIR_NAME

  fi

  mkdir -p $ROOT_DIR_NAME/$PROJECT_DIR_NAME

  mkdir -p $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME

  echo '/node_modules/* package-lock.json' | xargs -n1 > $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/.gitignore

  cp $ROOT_DIR_NAME/test.css $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test.css

  cp $ROOT_DIR_NAME/test.js $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test.js

  cp $ROOT_DIR_NAME/$TEMPLATE_NAME $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/$TEMPLATE_NAME

  cd $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME

  npm --yes init

  npm install jquery --save

  #ブラウザで実行できるようにトランスフォームコマンドをインストール
  #開発環境のみ必要
  npm install -D browserify

  npm bin

  exit 0

}

build(){

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

  cd $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME

  $(npm bin)/browserify $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test.js -o $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test-reshape.js

  exit 0

}

deploy(){

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

	sudo apachectl stop

  ps aux | grep apache | grep -v grep | awk '{print $2}' | xargs sudo kill -9

  sudo apachectl start

  #配備
  sudo cp $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test.html /var/www/html/test.html

  sudo cp $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test.css /var/www/html/test.css

  sudo cp $ROOT_DIR_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/test-reshape.js /var/www/html/test-reshape.js

  firefox --new-window http:/localhost:80/test.html

  exit 0

}

LANG_NAME=jQuery
ROOT_DIR_NAME=$HOME/script-sketch/$LANG_NAME

SUBCMD=$1;shift;

PROJECT_DIR_NAME=$1;shift;

APP_DIR_NAME=$1;shift;

TEMPLATE_NAME=$1;shift;

case $SUBCMD in

  *)
     if [[ $SUBCMD =~ "init"  ]];then
       init
     fi

     if [[ $SUBCMD =~ "build"  ]];then
       build
     fi

     if [[ $SUBCMD =~ "deploy"  ]];then
       deploy
     fi

     usage

esac

exit 0
