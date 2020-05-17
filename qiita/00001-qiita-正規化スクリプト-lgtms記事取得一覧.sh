#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 1 33
EOS
exit 0
}

INPUT_FILE_NAME=lgtms
INPUT_FILE_SUFFIX=.json
OUTPUT_FILE_NAME=lgtms
OUTPUT_FILE_SUFFIX=.tsv
OUTPUT_VIEW_FILE_NAME=lgtms
OUTPUT_VIEW_FILE_SUFFIX=.md
CROSSTAB_FILE_NAME=crosstab
CROSSTAB_FILE_SUFFIX=.tsv

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

    #サブグルーピングし直し
    jq -s -R 'split("\n")|map(.|select(.!=""))|map(split("\t"))|map({"grp":.[0],"subgrp":.[1],"label":.[2],"value":.[3]})' $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX | jq 'length as $cnt|. as $items|[range(0;$cnt)]|foreach .[] as $idx({};.+{grp:$items[$idx].grp,subgrp:(if $items[$idx]|.label|test("title") then $items[$idx].subgrp else ($items[$idx].subgrp|tonumber + 1) | tostring end ),label:$items[$idx].label,value:$items[$idx].value})'| jq -s 'group_by(.grp+.subgrp)[]|.[].grp as $grp|.[].subgrp as $subgrp |reduce .[].value as $item ([];.+[$item])|{grp:$grp,subgrp:$subgrp,items:("["+.[0]+"]("+.[1]+")")}'|jq -s 'unique[]' | jq -r '[.grp,.subgrp,.items]|@tsv' >a.tsv

   #並べ替え
   cat a.tsv | sort -nk1 -k2 -o $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX

   #ヘッダ挿入
   sed -i '1igrp\tsubgrp\tvalue' $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX

   #ダブルクォートの除去 git でbeautyにならない
   sed -i 's/\x22//g' $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX

   #参照用
   cp $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX $OUTPUT_VIEW_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_VIEW_FILE_SUFFIX

   sed -i -r 's/\t/\|/g;s/^/|/;s/$/|/;2i|:--|:--|:--|' $OUTPUT_VIEW_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_VIEW_FILE_SUFFIX

   #クロス集計用に列整形
   #cat $OUTPUT_FILE_NAME-page-$(printf "%03d" $n)$OUTPUT_FILE_SUFFIX | awk -v FS='\t' '{printf "%03d-%02d\t%s\t%s\n",$1,$2,NR%2,$4}' > a.tsv

   ##クロス集計
   #datamash -s crosstab 1,2 unique 3 < a.tsv > $CROSSTAB_FILE_NAME-page-$(printf "%03d" $n)$CROSSTAB_FILE_SUFFIX

   #sed -i '1d;' $CROSSTAB_FILE_NAME-page-$(printf "%03d" $n)$CROSSTAB_FILE_SUFFIX

   #sed -i '1i行番号\tキー\tバリュー' $CROSSTAB_FILE_NAME-page-$(printf "%03d" $n)$CROSSTAB_FILE_SUFFIX
done


rm -f a.tsv
