- IN

```
$cat a.json
{"key":"user-paginatedArticleLikes-items-29-article-uuid","value":"594ead48fece9b844d90"}
{"key":"user-paginatedArticleLikes-items-29-article-title","value":"お前Rは初めてか？力抜けよ"}
{"key":"user-paginatedArticleLikes-items-29-article-tags-0-name","value":"R"}
{"key":"user-paginatedArticleLikes-items-29-article-tags-0-urlName","value":"r"}
{"key":"user-paginatedArticleLikes-items-29-article-author-urlName","value":"ngr_t"}
{"key":"user-paginatedArticleLikes-items-30-article-uuid","value":"365a2abcdaaf99b720be"}
{"key":"user-paginatedArticleLikes-items-30-article-title","value":"Rの型について理解する"}
{"key":"user-paginatedArticleLikes-items-30-article-tags-0-name","value":"R"}
{"key":"user-paginatedArticleLikes-items-30-article-tags-0-urlName","value":"r"}
{"key":"user-paginatedArticleLikes-items-30-article-author-urlName","value":"maruman029"}
{"key":"user-paginatedArticleLikes-items-31-article-uuid","value":"361a42baf1e94edf5846"}
{"key":"user-paginatedArticleLikes-items-31-article-title","value":"R のモダンな NA 処理まとめ"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-0-name","value":"R"}
{"key":"user-paginatedArticleLikes-items-31-article-tags-0-urlName","value":"r"}
{"key":"user-paginatedArticleLikes-items-31-article-author-urlName","value":"five-dots"}
{"key":"user-paginatedArticleLikes-items-32-article-uuid","value":"4727a0d64657aa837ce3"}
{"key":"user-paginatedArticleLikes-items-32-article-title","value":"JavaScript ベスト・オブ・ザ・イヤー 2019"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-0-name","value":"JavaScript"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-0-urlName","value":"javascript"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-1-name","value":"GitHub"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-1-urlName","value":"github"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-2-name","value":"日本語訳"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-2-urlName","value":"%e6%97%a5%e6%9c%ac%e8%aa%9e%e8%a8%b3"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-3-name","value":"bestofjs"}
{"key":"user-paginatedArticleLikes-items-32-article-tags-3-urlName","value":"bestofjs"}
{"key":"user-paginatedArticleLikes-items-32-article-author-urlName","value":"rana_kualu"}
```


- CMD


```
$cat a.json | jq -c 'select(.key|(test("tags")))|{grp:.key|gsub(".*items-";"")|gsub("-.+";""),subgrp:.key|gsub(".*tags-";"")|gsub("-.+";""),label:.key|gsub(".*-";""),value:.value}'| jq -s 'map({grp:.grp,subgrp:.subgrp,label:.label,value:(if .label=="urlName" then "https://qiita.com/tags/"+.value else .value end)})|.[]'|jq -c 'select(.label|test("name"))'
```


- OUT

```
{"grp":"29","subgrp":"0","label":"name","value":"R"}
{"grp":"30","subgrp":"0","label":"name","value":"R"}
{"grp":"31","subgrp":"0","label":"name","value":"R"}
{"grp":"32","subgrp":"0","label":"name","value":"JavaScript"}
{"grp":"32","subgrp":"1","label":"name","value":"GitHub"}
{"grp":"32","subgrp":"2","label":"name","value":"日本語訳"}
{"grp":"32","subgrp":"3","label":"name","value":"bestofjs"}
```
