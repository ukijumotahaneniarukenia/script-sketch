#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 python
EOS
exit 0
}

TAG=$1;shift

[ -z $TAG ] && usage

curl -sSL https://dev.to/t/$TAG/top/year | sed -z 's/\n//g' | grep -Po '(?<=<a).*?(?=/a>)' | grep data-preload-image | \
  while read n;do
    echo -e "$(echo $n | grep -Po '(?<=href=")(.*?)(?=")')\t$(echo $n | grep -Po '(?<=>)(.*?)(?=<)' | sed 's/^ //;' | sed '/^$/d;/^#/d')"
  done
