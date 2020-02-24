#!/bin/bash

cat test.json | jq -rc 'paths|map(if type=="number" then "["+tostring+"]" else "."+. end)|join("")' | sed -r 's;^;\.;' | \
  while read tgt;do
    PATH_EXPR=$(echo "$tgt|select(type==\"number\" or type==\"string\" or type==\"boolean\")")
    RT=$(printf "%s %s\n" "jq -r -c '$PATH_EXPR'" test.json | sh)
    if [ "XXX$RT" != "XXX" ]; then
      printf "%s\t%s\n" "$(printf "%s\n" "$PATH_EXPR")" "$(printf "%s %s\n" "jq -c '$PATH_EXPR'" test.json | sh)"
    fi
  done
