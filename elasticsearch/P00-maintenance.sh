#!/usr/bin/env bash

sudo apt install -y moreutils

dummydat-bash test.txt test.tsv ja 100

tsv2json-jq test.tsv test.json

#数値型はダブルクォートを除去
perl -i -pe 's/"(-[0-9\.]+)"/$1/;s/"([0-9\.]+)"/$1/;' test.json

#日付型はよしなに判定するらしい
#https://www.elastic.co/guide/en/elasticsearch/reference/7.8/date.html

#データ投入用に構造変換
cat test.json | jq -c 'to_entries|map([{index:{"_id":.key|tostring}},.value])|flatten|.[]'>test.json.done


cat test.txt | ruby -anle 'p format("col%03d",($.)),case when $F[0].index(/number-positive|number-negative/);"float";when $F[0].index(/number-non-zero-digit|number-digit/);"integer";when $F[0].index(/date|time/);"date";else "text";end,$F[0].gsub(/^faker-/,"").gsub(/-ruby$/,""),$F[0]' | xargs -n4 | tr ' ' '\t'>test-type-mapping.tsv

cat test-type-mapping.tsv | jq -rRc './"\t"|"\""+.[0]+"\":{\""+("type")+"\":\""+.[1]+"\"}"'|sed 's/^/,/'|tr -d \\\n | sed 's/^,//' >test-type-mapping-placeholder.json

sed '/TOBE_REPLACE/r test-type-mapping-placeholder.json' test-type-mapping-template.json >test-type-mapping.json

sed -i '/TOBE_REPLACE/d' test-type-mapping.json

sed '/TOBE_REPLACE/r test-type-mapping.json'  create-00001-インデックス作成-template.json > create-00001-インデックス作成.json

sed -i '/TOBE_REPLACE/d' create-00001-インデックス作成.json

jq '' create-00001-インデックス作成.json | sponge create-00001-インデックス作成.json
