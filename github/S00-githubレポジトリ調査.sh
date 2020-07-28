#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 nuxtjs
EOS
  exit 0
}

WORD="$1";shift

EXCLUDE_REGEXP_PATTERN_URL="(about|contact|events|fluidicon|pricing|search|search/count|security|site/privacy|site/terms|notifications/beta)$"

STAR_CATCH_REGEXP_PATTERN="[0-9]+(?= users starred this repository)"

LIMIT_SEARCH_PAGE_CNT=3

[ -z $WORD ] && usage

curl -s -o a.html "https://github.com/search?o=desc&p=1&q=$WORD&s=stars&type=Repositories"

MX_HIT_PAGE_CNT=$(cat a.html | grep -oP '(?<=Page)\s+[0-9]+'|tail -n1|tr -d ' ')

rm a.html

[ -z "$MX_HIT_PAGE_CNT" ] && usage

if [[ $MX_HIT_PAGE_CNT -gt $LIMIT_SEARCH_PAGE_CNT ]];then
  MX_HIT_PAGE_CNT=$LIMIT_SEARCH_PAGE_CNT
fi

for ((i=1;i<=$MX_HIT_PAGE_CNT;i++)); do
  if [[ $i -eq 1 ]] ;then
    #ヘッダの書き込み
    echo -e "url\tstar"
  fi
  #ボディの書き込み
  curl -s "https://github.com/search?o=desc&p=$i&q=$WORD&s=stars&type=Repositories" | grep -Po 'https://github.com(/[0-9a-zA-Z\@\[\]\~\.\-\(\)]+){2}' | grep -vP "$EXCLUDE_REGEXP_PATTERN_URL" | \
  while read tgt;do
    STAR_CNT=$(curl -s $tgt | grep -Po "$STAR_CATCH_REGEXP_PATTERN")
    printf "%s\t%s\n" $tgt ${STAR_CNT:-0}
    sleep 0.5
  done
done  | tee $(date "+%Y-%m-%dT%H-%M-%S")-$WORD-github.tsv
