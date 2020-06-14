#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 00001-jQuery-Use-jquery-via-nodejs --init

  or

  $0 00001-jQuery-Use-jquery-via-nodejs --deploy
EOS
exit 0
}

SKETCH_DIR=$1;shift

OPTION_FLG=$1;shift

[ -z $SKETCH_DIR ] && usage

mkdir -p $SKETCH_DIR

echo '/node_modules/*' > $SKETCH_DIR/.gitignore

if [ $OPTION_FLG == "--init" ];then

   cd $SKETCH_DIR

   npm --yes init


   npm install jquery --save

   #ブラウザで実行できるようにトランスフォームコマンドをインストール
   #開発環境のみ必要
   npm install -D browserify

   npm bin

   ls -lh $(npm bin)/browserify

   sudo apachectl stop


   ps aux | grep apache | grep -v grep | awk '{print $2}' | xargs sudo kill -9


   sudo apachectl start

fi

if [ $OPTION_FLG == "--deploy" ];then

   sudo apachectl stop


   ps aux | grep apache | grep -v grep | awk '{print $2}' | xargs sudo kill -9


   sudo apachectl start

   #配備
   sudo cp test.html /var/www/html/test.html

   sudo cp test.css /var/www/html/test.css

   sudo $(npm bin)/browserify test.js -o /var/www/html/test.js

   firefox test.html
fi
