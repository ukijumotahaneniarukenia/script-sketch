#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 00004-jQuery-nodejs経由でjqueryライブラリを使用する --init
  or
  $0 00004-jQuery-nodejskeiyudejqueryraiburariwoshiyousuru --deploy
EOS
exit 0
}

SKETCH_DIR=$1;shift

OPTION_FLG=$1;shift

[ -z $SKETCH_DIR ] && usage

TMP_SKETCH_DIR=$SKETCH_DIR

SKETCH_DIR_LATIN=$(echo $SKETCH_DIR | mecab | awk '{print $1}' | head -n-1 | \
  while read s;do
    echo $s | grep -P '\p{Hiragana}|\p{Katakana}|\p{Han}'| mecab -Oyomi| uconv -x katakana-hiragana | uconv -x hiragana-latin;
    echo $s | grep -vP '\p{Hiragana}|\p{Katakana}|\p{Han}';
  done | xargs | tr -d  ' ' | tee -a pre2post)


SKETCH_DIR=$SKETCH_DIR_LATIN


if [ $OPTION_FLG == "--init" ];then

  (

   mkdir -p $SKETCH_DIR

   echo '/node_modules/*' > $SKETCH_DIR/.gitignore
   echo $TMP_SKETCH_DIR >>$SKETCH_DIR/pre2post
   echo $SKETCH_DIR >>$SKETCH_DIR/pre2post

   cd $SKETCH_DIR

   npm --yes init


   npm install jquery --save

   #ブラウザで実行できるようにトランスフォームコマンドをインストール
   #開発環境のみ必要
   npm install -D browserify

   npm bin

   ls -lh $(npm bin)/browserify
  )

   cp test.html $SKETCH_DIR/test.html

   cp test.css $SKETCH_DIR/test.css

   cp test.js $SKETCH_DIR/test.js

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

   firefox --new-window http:/localhost:80/test.html
fi
