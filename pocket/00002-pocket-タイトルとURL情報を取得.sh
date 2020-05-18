#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0
EOS
exit 0
}

INPUT_FILE_NAME=pocket.json
OUTPUT_FILE_NAME=pocket.tsv

rm -f $OUTPUT_FILE_NAME

cat $INPUT_FILE_NAME | jq --stream -c '' | grep -P 'resolved_url|resolved_title' | jq -c '{key:.[0]|join("-"),value:.[1]}|select(.value!="")|{grp:.key|gsub("\\D+";""),key:.key|gsub(".*-";"")|gsub(".*_";""),value:.value}' | jq -s 'group_by(.grp)[]|.[].grp as $grp|reduce .[].value as $item([];.+[$item])|{title:.[0],url:.[1]}' | jq -s 'unique' | jq -r '.[]|[.title,.url]|@tsv' | sed '1iタイトル\tURL' > $OUTPUT_FILE_NAME
