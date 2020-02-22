#!/bin/bash

cat pom.json | jq --stream -c 'select(length==2)|{key:.[0]|join("."),value:.[1]}|.key' \
  | sed -r 's;\.#(tail|text);;;s;";;g' \
  | grep -vP '[0-9]+$|dependencies$' \
  | uniq | sed -r  's;^;/;;s;\.;/;g' \
  | perl -pe 's;(.*)/([0-9]+)(/.*);\1\[position()=\2\]\3;g' \
  | perl -pe 's/(?<=position\(\)=)([0-9]+)(?=])/$1+1/eg' \
  | while read tgt;do
      printf "cat %s | xmllint --xpath \x27%s\x27 - && echo \n" pom.xml $tgt | sh
    done \
  | grep -Po '(?<=\>).*(?=\<)' \
  | sed '1itgt'>a.out
