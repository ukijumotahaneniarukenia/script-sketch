#!/usr/bin/env bash

usage(){
  cat <<EOS
Usage:
  $0 script-env
EOS
exit 0
}

ceil() {
  rt=$((($1+$2-1)/$2))
  echo $rt
}

SEPARATOR='\t'

ENV_REPO=$1

[ -z $ENV_REPO ] && usage

TANGO_LIST_FILE=tango-list-file.txt
RESULT_FILE=transpose-index.tsv

HEADER="行番号\t単語\tファイル名\t開始列番号\t文書"

for w in $(cat $TANGO_LIST_FILE);do

  echo $w | xargs -I@ ack --nocolor --nogroup --column @ -r $HOME/$ENV_REPO | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})*)?m//g" | \
    awk -v WORD=$w -v FS=':' -v OFS='\n' '{print WORD,$1,$2,$3,$4}'

done | nl | \
while read rn s;do
  echo $(ceil $rn 5) "$s"
done | awk -v SEP=$SEPARATOR '{k=$1;$1="";a[k]=a[k] SEP $0}END{for(e in a){print e,a[e]}}' | sort -nk1 | sed "1i$HEADER" >$RESULT_FILE
