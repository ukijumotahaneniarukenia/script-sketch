#!/usr/bin/env bash

TGT_FILE=$1;

[ -z "$TGT_FILE" ] && exit 1

cat "$TGT_FILE" | jq -r 'paths|map(if type=="number" then "["+tostring+"]" else "."+tojson end)|join("")' | \
while read tgt;do
  PATH_EXPR=$(echo "."$tgt) #パス式の先頭にドットを付与
  cat "$TGT_FILE" | jq -c "$PATH_EXPR" | grep -vP '^{' | \
    jq -c 'if(test("^items")) then split(".") else . end' | perl -pe 's;(?<="),(?=");\n;g' | perl -pe 's;^\[|\]$;;'
done
