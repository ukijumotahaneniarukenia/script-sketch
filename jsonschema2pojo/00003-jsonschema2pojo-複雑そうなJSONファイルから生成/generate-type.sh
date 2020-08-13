#!/usr/bin/env bash

INPUT_FILE_NAME=sample.json

cat $INPUT_FILE_NAME | jq --stream -c -r '.[0]|map(if type=="number" then "["+tostring+"]" else "."+. end)|join("")' | \


  while read path;do


    cat $INPUT_FILE_NAME | jq -r "[\"$path\",($path|type)]|join(\"\t\")"


  done | teip -Gog '(?<=\[)\d+(?=\])' -- sed 's/./0/g' | sort | uniq | jq -R './"\t"|{(.[0]):{ "type":.[1],"format":""}}' | jq -s 'reduce .[] as $item ({};.+$item)'
