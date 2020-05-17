#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 1 3
EOS
exit 0
}

INPUT_FILE_NAME=nnn.json
OUTPUT_FILE_NAME=nnn.tsv

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
done >$INPUT_FILE_NAME

cat $INPUT_FILE_NAME | jq -c 'select(.key|(test("title")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:(if "user"==(.key|gsub(".*tags-";"")|gsub("-.+";"")) then "0" else . end),label:.key|gsub(".*-";""),value:.value}' | jq -r '[.grp,.subgrp,.label,.value]|@tsv' >$OUTPUT_FILE_NAME

cat $INPUT_FILE_NAME | jq -c 'select(.key|(test("tags")|not))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:(if "user"==(.key|gsub(".*tags-";"")|gsub("-.+";"")) then "0" else . end),label:.key|gsub(".*-";""),value:.value}' | jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label|test("urlName") then "https://qiita.com/"+.value else .value end)})|group_by(.grp)[]|.[].grp as $grp|.[].subgrp as $subgrp|reduce .[].value as $item([];.+[$item])|{grp:$grp,subgrp:$subgrp,label:"urlName",value:(.[2]+"/items/"+.[0])}' | jq -s 'unique|.[]' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'>>$OUTPUT_FILE_NAME

cat $INPUT_FILE_NAME | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("name"))' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'>>$OUTPUT_FILE_NAME

cat $INPUT_FILE_NAME | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("urlName"))' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'>>$OUTPUT_FILE_NAME

cat $OUTPUT_FILE_NAME | sort -nk1 -o $OUTPUT_FILE_NAME

sed -i '1igrp\tsubgrp\tlabel\tvalue' $OUTPUT_FILE_NAME
