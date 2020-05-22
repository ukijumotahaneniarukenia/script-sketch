#!/bin/bash

usage(){
cat <<EOS
Usage:
  $0 100
EOS
exit 0
}

day=20140101
range=365
len=32
nn=$1;shift

[ -z $nn ] && usage

cat <<EOS >tbl-def
商品コード num 5
原価       num 3
売価       num 3
商品名     str 10
更新日     yyyymmdd
EOS

cat tbl-def | juni | \
  while read id tag typ len;do
    if [ $typ = "num" ];then
      bash 00001-Tukubai-数値型データの作成.sh $len $nn $tag
    elif [ $typ = "str" ];then
      bash 00002-Tukubai-文字列型データの作成.sh $len $nn $tag
    elif [ $typ = "yyyymmdd" ];then
      bash 00003-Tukubai-日付型データの作成.sh $day $range $nn $tag
    fi
  done

paste -d'\t' done-* >test.tsv

rm -rf done-*

exit 0
