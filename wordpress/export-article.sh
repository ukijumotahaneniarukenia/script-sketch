#!/usr/bin/env bash

BASE_URL=https://www.webprofessional.jp/wp-json/wp/v2/posts

PER_PAGE=10
#
TOTAL_PAGES=$(curl -s -D - -o /dev/null -X GET -H 'application/json' "$BASE_URL" | grep -P 'x-wp-totalpages' | awk -F':' '$0=$2' | xargs)

MAX_PAGES=$(awk -v TOTAL_PAGES=$TOTAL_PAGES -v PER_PAGE=$PER_PAGE '{printf("%.0f\n", 1+(TOTAL_PAGES/PER_PAGE))}' <<<"")

OUTPUT_FILE_NAME=dump-$(date "+%Y-%m-%dT%H-%M-%S").json

(

for (( CURRENT_PAGE=1;CURRENT_PAGE<=MAX_PAGES;CURRENT_PAGE++ ));do

  curl -s -X GET -H 'application/json' https://www.webprofessional.jp/wp-json/wp/v2/posts?per_page=$PER_PAGE&page=$CURRENT_PAGE | jq

done

) >$OUTPUT_FILE_NAME
