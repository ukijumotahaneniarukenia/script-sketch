#!/usr/bin/env bash

cat a.json | jq -c 'select(.key|(test("title")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:(if "user"==(.key|gsub(".*tags-";"")|gsub("-.+";"")) then "0" else . end),label:.key|gsub(".*-";""),value:.value}' | jq -r '[.grp,.subgrp,.label,.value]|@tsv' >a.tsv

cat a.json | jq -c 'select(.key|(test("tags")|not))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:(if "user"==(.key|gsub(".*tags-";"")|gsub("-.+";"")) then "0" else . end),label:.key|gsub(".*-";""),value:.value}' | jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label|test("urlName") then "https://qiita.com/"+.value else .value end)})|group_by(.grp)[]|.[].grp as $grp|.[].subgrp as $subgrp|reduce .[].value as $item([];.+[$item])|{grp:$grp,subgrp:$subgrp,label:"urlName",value:(.[2]+"/items/"+.[0])}' | jq -s 'unique|.[]' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'>>a.tsv

cat a.json | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("name"))' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'>>a.tsv

cat a.json | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("urlName"))' | jq -r '[.grp,.subgrp,.label,.value]|@tsv'>>a.tsv

cat a.tsv | sort -nk1 -o a.tsv

sed -i '1igrp\tsubgrp\tlabel\tvalue' a.tsv
