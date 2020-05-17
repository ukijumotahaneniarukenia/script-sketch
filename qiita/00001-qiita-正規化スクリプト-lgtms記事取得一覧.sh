#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 1 3
EOS
exit 0
}

OUTPUT_FILE_NAME=nnn.json

START_PAGE=$1;shift
END_PAGE=$1;shift

[ -z $START_PAGE ] && usage
[ -z $END_PAGE ] && usage

seq $START_PAGE $END_PAGE | while read n;do
  curl -sSL "https://qiita.com/ukijumotahaneniarukenia/lgtms?page=$n" | \
    grep -Po '(?<=<script).*?(?=/script>)' | \
    grep UserLgtms | \
    grep -Po '(?<=>){.*?}(?=<)' | \
    jq --stream -c '' | \
    grep paginatedArticleLikes | \
    grep -P 'uuid|tag|title|author' | \
    grep -vP 'profileImageUrl' | \
    jq -c '{key:.[0]|map(if type=="number" then tostring else . end)|join("-"),value:.[1]}' | \
    jq -c 'select(.value!=null)'
done >$OUTPUT_FILE_NAME
