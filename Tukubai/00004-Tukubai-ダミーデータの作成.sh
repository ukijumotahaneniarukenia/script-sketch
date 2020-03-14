#!/bin/bash

day=20140101
range=365
nn=$1;shift


cat <<EOS >a
商品コード num 5
原価       num 3
売価       num 3
商品名     str 10
更新日     yyyymmdd
EOS

cat a | juni | \
  while read id tag typ len;do
    mkfifo a-$id
    if [ $typ = "num" ];then
      bash 00001-Tukubai-数値型データの作成.sh $len $nn >a-$id &
    elif [ $typ = "str" ];then
      bash 00002-Tukubai-文字列型データの作成.sh $len $nn >a-$id &
    elif [ $typ = "yyyymmdd" ];then
      bash 00003-Tukubai-日付型データの作成.sh $len $nn >a-$id &
    fi
  done

paste -d' ' a-*

rm -rf a-*

exit 0
