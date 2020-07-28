#!/usr/bin/env bash

#echo java javascript nuxtjs nodejs spring nim Linq XDocument SgmlReader AngleSharp jq | xargs -n1 | \
echo SQLite::OPEN_READONLY | xargs -n1 | \

while read keyword;do

  bash S00* $keyword
  sleep 0.5

done
