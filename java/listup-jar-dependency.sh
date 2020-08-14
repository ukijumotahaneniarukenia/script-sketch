#!/usr/bin/env bash

WORKDIR=$HOME/script-sketch/java/wrksp

ls $WORKDIR/*tsv | xargs -I@ grep -P '/project/dependencies/dependency\[.*\]/artifactId|/project/dependencies/dependency\[.*\]/version' @ | grep -P '\[2\]' | \
  awk '/artifactId/{print 1,$0};/version/{print 0,$0};' | awk '{print pre=pre+$1,$0;}'| ruby -anle 'p $F[0],$F[1],$F[2].gsub(/.*\//,""),$F[3]' | xargs -n4  | \
  awk '{a[$1]=a[$1]$0}END{for(e in a)print e,a[e]}'|awk '{print $1,$4,$5,$7,$8}' OFS="\t" | sort -nk1 >listup-jar-dependency.tsv
