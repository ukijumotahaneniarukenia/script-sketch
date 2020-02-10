#!/bin/bash

FILE=$1

cat "$FILE" | jq -r 'paths|map(if type=="number" then "."+"["+tostring+"]" else "."+tojson end)|join("")' |\
  while read path_expr;do
    printf "%s=%s\n"  $path_expr "$(cat "$FILE" | jq "$path_expr|if type==\"number\" or type==\"string\" or type==\"boolean\" then . else empty end ")" | sed -e '/=$/d'
  done
