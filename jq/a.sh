#!/bin/bash



cat test.json.done | jq -rc 'paths|map(if type=="number" then "["+tostring+"]" else "."+. end)|join("")' | sed -r 's;^;\.;' | \
  while read tgt;do
    PATH_EXPR=$(echo "$tgt|select(type==\"number\" or type==\"string\" or type==\"boolean\")")
    printf "%s %s\n" "jq -c '$PATH_EXPR'" test.json.done | sh
  done
