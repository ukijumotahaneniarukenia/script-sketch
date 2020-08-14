#!/usr/bin/env bash

WORKDIR=$HOME/script-sketch/java/wrksp

OUTPUT_FILE_NAME=listup-jar-dependency.tsv

PATTERN="/project/dependencies/dependency\[.*\]/artifactId|/project/dependencies/dependency\[.*\]/version"

START_NO=$(ls $WORKDIR/*tsv | xargs -I@ grep -P "$PATTERN" @  | grep -Po '(?<=\[)\d+(?=\])' | sort -nk1 | head -n1)

END_NO=$(ls $WORKDIR/*tsv | xargs -I@ grep -P "$PATTERN" @  | grep -Po '(?<=\[)\d+(?=\])' | sort -nk1 | tail -n1)

rm -rf $OUTPUT_FILE_NAME

touch $OUTPUT_FILE_NAME

for (( i=$START_NO;i<=$END_NO;i++ ));do

  ls $WORKDIR/*tsv | xargs -I@ grep -P "$PATTERN" @ | grep -P "\[$i\]" | \
    awk '/artifactId/{print 1,$0};/version/{print 0,$0};' | \
    awk '{print pre=pre+$1,$0;}'| \
    ruby -anle 'p $F[0],$F[1],$F[2].gsub(/.*\//,""),$F[3]' | xargs -n4  | \
    awk '{key=$1;$1="";$2="";a[key]=a[key]$0}END{for(e in a)print e,a[e]}' | \
    awk '{if (length($4)==0 && length($5)==0){print $1,$2,$3,"-","-"}else{print $1,$2,$3,$4,$5}}' OFS="\t" | \
    awk '{$1="";print $0}' OFS="\t" | sed 's/^\t//' | sort | uniq >>$OUTPUT_FILE_NAME

done
