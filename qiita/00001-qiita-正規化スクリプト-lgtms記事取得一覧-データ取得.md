- CMD

```
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
    jq -c '{key:.[0]|map(if type=="number" then tostring else . end)|join("-"),value:.[1]}|select(.value!=null)'
done
```

- OUT

```
{"key":"user-paginatedArticleLikes-items-31-article-uuid","value":"b2765e9e87025c01e57f"}
{"key":"user-paginatedArticleLikes-items-31-article-title","value":"dictで一つのキーに複数の値を持ちたい時の実装方法"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-0-name","value":"Python"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-0-urlName","value":"python"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-1-name","value":"AdventCalendar"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-1-urlName","value":"adventcalendar"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-2-name","value":"Python3"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-2-urlName","value":"python3"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-3-name","value":"Python2"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-3-urlName","value":"python2"}
{"key":"user-paginatedArticleLikes-items-31-article-author-urlName","value":"tag1216"}
{"key":"user-paginatedArticleLikes-items-32-article-uuid","value":"92c339a65533e1e6c6fc"}
{"key":"user-paginatedArticleLikes-items-32-article-title","value":"実用 perl ワンライナー"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-0-name","value":"Perl"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-0-urlName","value":"perl"}
{"key":"user-paginatedArticleLikes-items-32-article-author-urlName","value":"ohtsuka1317"}
```
