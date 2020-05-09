#!/usr/bin/bash

curl -sSLO 'http://www.htmq.com/text'

cat text | grep t01 | grep -oP '(?<=<span).*?(?=</span>)' | \
while read n;do
  rt="$(echo $n | tr -d ' ' |perl -pe 's/.*>//g')"

  if [ -z "$rt" ] ;then

    echo うんこ

  else

    echo $rt

  fi

done | xargs -n4 | sed -r 's/ \&amp\;/\t/g' >numchar-table.tsv


rm -f text
