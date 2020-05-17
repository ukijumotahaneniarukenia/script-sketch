#!/usr/bin/env bash

seq 1 2 | while read n;do
  curl -sSL "https://qiita.com/ukijumotahaneniarukenia/lgtms?page=$n" | \
    grep -Po '(?<=<script).*?(?=/script>)' | \
    grep UserLgtms | \
    grep -Po '(?<=>){.*?}(?=<)' | \
    jq --stream -c '' | \
    grep paginatedArticleLikes | \
    grep -P 'uuid|tag|title|author' | \
    grep -vP 'profileImageUrl' | \
    jq -c '{key:.[0]|map(if type=="number" then tostring else . end)|join("-"),value:.[1]}' | \
    jq -c 'select(.value!=null)'
done
