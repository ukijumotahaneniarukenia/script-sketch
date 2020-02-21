#!/bin/bash

TGT_FILE_NAME=$1
DENOMINATOR=$2

#空文字チェック
[ -z $DENOMINATOR ] && exit 1
[ -z $TGT_FILE_NAME ] && exit 1

#正負チェック
grep -q -P '^-' <<<$DENOMINATOR && exit 1
grep -q -P '^-' <<<$DENOMINATOR || :

#数値チェック
grep -q -P '^[0-9]+$' <<<$DENOMINATOR || exit 1
grep -q -P '^[0-9]+$' <<<$DENOMINATOR && :

#ファイル存在チェック
ls $TGT_FILE_NAME 2>/dev/null 1>&2 || exit 1
ls $TGT_FILE_NAME 2>/dev/null 1>&2 && :

cat $TGT_FILE_NAME | nl | awk -v D=$DENOMINATOR -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1}BEGIN{D=D}{print $1,ceil($1,D),$2}' | sed '1iseq,grp,val'
