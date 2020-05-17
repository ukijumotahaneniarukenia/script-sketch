#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 1 3
EOS
exit 0
}

INPUT_FILE_NAME=nnn.json
INPUT_FILE_SUFFIX=.json
OUTPUT_FILE_NAME=nnn
OUTPUT_FILE_SUFFIX=.tsv

START_PAGE=$1;shift
END_PAGE=$1;shift

[ -z $START_PAGE ] && usage
[ -z $END_PAGE ] && usage

rm -f $INPUT_FILE_NAME*$INPUT_FILE_SUFFIX
rm -f $OUTPUT_FILE_NAME*$OUTPUT_FILE_SUFFIX

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
    jq -c 'select(.value!=null)' | tee $INPUT_FILE_NAME-page-$(printf "%03d" $n)$INPUT_FILE_SUFFIX 1>/dev/null

   {
    #タイトル情報の取得
    cat $INPUT_FILE_NAME-page-$(printf "%03d" $n)$INPUT_FILE_SUFFIX | jq -c 'select(.key|(test("title")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:(if "user"==(.key|gsub(".*tags-";"")|gsub("-.+";"")) then "0" else . end),label:.key|gsub(".*-";""),value:.value}' | jq -c '{grp:.grp,subgrp:.subgrp,label:"01-title",value:.value}' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'

    #URL情報の取得
    cat $INPUT_FILE_NAME-page-$(printf "%03d" $n)$INPUT_FILE_SUFFIX | jq -c 'select(.key|(test("tags")|not))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:(if "user"==(.key|gsub(".*tags-";"")|gsub("-.+";"")) then "0" else . end),label:.key|gsub(".*-";""),value:.value}' | jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label|test("urlName") then "https://qiita.com/"+.value else .value end)})|group_by(.grp)[]|.[].grp as $grp|.[].subgrp as $subgrp|reduce .[].value as $item([];.+[$item])|{grp:$grp,subgrp:$subgrp,label:"urlName",value:(.[2]+"/items/"+.[0])}' | jq -s 'unique|.[]' | jq -c '{grp:.grp,subgrp:.subgrp,label:"02-titleUrlName",value:.value}' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'

    #タグ情報の取得
    cat $INPUT_FILE_NAME-page-$(printf "%03d" $n)$INPUT_FILE_SUFFIX | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("name"))' | jq -c '{grp:.grp,subgrp:.subgrp,label:"03-tag",value:.value}' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'

    #タグURL情報の取得
    cat $INPUT_FILE_NAME-page-$(printf "%03d" $n)$INPUT_FILE_SUFFIX | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("urlName"))' | jq -c '{grp:.grp,subgrp:.subgrp,label:"04-tagUrlName",value:.value}' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'

   } | tee -a $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX 1>/dev/null

   #並べ替え
   cat $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX | sort -nk1 -k2 -k3 -o $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX

   #ヘッダ挿入
   sed -i '1igrp\tsubgrp\tlabel\tvalue' $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX

   #ダブルクォートの除去 git でbeautyにならない
   sed -i 's/\x22//g' $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX

done
