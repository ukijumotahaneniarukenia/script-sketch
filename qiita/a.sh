#!/bin/bash

cat test.tsv | while read tgt;do
  echo $tgt | grep -Po '(?<= href=)/.*/.*/[0-9a-z]{20}' | sed 's;^;https://qiita.com;' | perl -pe 's; href=/.*/.*/[0-9a-zA-Z]{20};;'
  echo $tgt | grep -n -Po 'href=/tags/[0-9a-zA-Z%]+' | perl -pe 's;href=/tags/;;' | awk -v FS=':' '{F[$1]=F[$1] DEL[$1] $2;DEL[$1]=","}END{for(key in F){print key,F[key]}}' | sort -nk1 | awk '{print $2}'
  echo $tgt | awk '{print $(NF-1)}'
  echo $tgt | awk '{print $(NF)}'
done | xargs -n4 | column -t -s' ' >test.tsv.done
