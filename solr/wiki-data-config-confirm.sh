#!/bin/bash

file="$1"

#grep -Po '<.*>' $file | head -n100 | awk '/<page>/,/<\/page>/{if($0=="<page>"){print 1,$0}else{print 0,$0}}' | nl
grep -Po '<.*>' $file | head -n100 | awk '/<page>/,/<\/page>/{if($0=="<page>"){print 1,$0}else{print 0,$0}}' | nl | sed -n '1,22p' | awk '{print $3}'


#xmlをjsonに変換
#xml2json.py -t xml2json -o wiki-data-entity.json wiki-data-entity.xml


#1以外が0件であることを確認
#cat wiki-data-entity.json | gron | grep -vP 'tail|{};' | perl -pe 's/\[.*//g' | uniq -c | grep -c -v 1


#cat wiki-data-entity.json | gron | grep -vP 'tail|{};' | perl -pe 's/\[.*//g' | sed -r 's;json;/mediawiki;;s;\.;/;g'>wiki-data-config-xpath
