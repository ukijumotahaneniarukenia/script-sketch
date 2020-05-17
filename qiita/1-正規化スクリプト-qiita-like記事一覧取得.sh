#!/bin/bash


#左から
#ユーザー、記事ＩＤ、タグ（単一ないし複数）、投稿日時、タイトル
#href=/shiozaki href=/shiozaki/items/1fbab58b26fe3f6cf9ad href=/tags/apache href=/tags/qiita href=/tags/rails href=/tags/ruby href=/tags/solr 2016-08-18 ApacheSolrを使った検索サジェスターの作り方まとめ

while read tgt;do
  echo $tgt
  #TAGS=$(echo $tgt | sed -r 's;<ulclass=pagination>|</div><divclass=text-center>;;;' | grep -Po 'href=(/[a-zA-Z%0-9]+){1,}' | sort | uniq)
  #DTM=$(echo $tgt | sed -r 's;<ulclass=pagination>|</div><divclass=text-center>;;;' | \
  #  grep -Po '(?<=postedon)(Apr|Aug|Dec|Feb|Jan|Jul|Jun|Mar|May|Nov|Oct|Sep)[0-9]{2},[0-9]{4}' | \
  #  sed -r 's;([0-9]{2}); \1;;s;,; ;' | \
  #  tr ' ' '-'
  #)
  #TITLE=$(echo $tgt | sed -r 's;<ulclass=pagination>|</div><divclass=text-center>;;;'| sed -r 's;</a>;\n;g' | grep -v img | grep -Po 'href=(/[a-zA-Z%0-9]+){1,}.*' | tr '>' ' ' | grep -P '[0-9a-z]{20}' | grep -vP '[0-9a-z]{20} [0-9]{1,}'|cut -d' ' -f2)
  #echo $TAGS $(date -d  "$(tr "-" " " <<<$DTM)" "+%Y-%m-%d") $(sed -r 's;\s{1,};;g;s;　{1,};;g' <<<$TITLE)
done < <(curl -sSL https://qiita.com/ukijumotahaneniarukenia/like?page={1..1}|sed -r 's;<article;\n<article;g'|tr -d ' '| grep -P '^<(?:article|ul)(?=class=)' | xargs -n2) | sed '$d'
