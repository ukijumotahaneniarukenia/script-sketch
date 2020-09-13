#!/usr/bin/env bash

usage(){

cat <<EOS
Usage:

CMD: bash ${0##*/} /bin

EOS

exit 0

}

TARGET_DIR_NAME=$1;shift;

if [ -z $TARGET_DIR_NAME ];then

  usage

fi

if ! [ -d $TARGET_DIR_NAME ];then

  usage

fi

time tree -a -ugpfhqD --timefmt '%Y-%m-%dT%H:%M:%S' -J $TARGET_DIR_NAME | sed -r 's;\\;\\\\;g;' | jq -r 'def UNKO:select(.!=null)|if(has("contents")) then ([.type,.name,.mode,.prot,.user,.group,.size,.time,.directories,.files]),(.contents[]|UNKO)else [.type,.name,.mode,.prot,.user,.group,.size,.time,.directories,.files] end;.[]|UNKO|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup\tsize\tlast-modified\tdirectories\tfiles'
