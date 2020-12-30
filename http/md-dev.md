http2の説明

- https://developers.google.com/web/fundamentals/performance/http2/?hl=ja

- https://tools.ietf.org/html/

- https://tools.ietf.org/html/rfc7231

html形式など配布されている
- https://www.rfc-editor.org/info/rfc7231

日本語でmozillaがわかりやすい
- https://developer.mozilla.org/ja/docs/Web/HTTP/Status

7つの神器

- https://www.iab.org/

- https://www.iana.org/

- https://www.ietf.org/

- https://www.irtf.org/

- https://www.rfc-editor.org/about/independent

- https://www.internetsociety.org/

- https://trustee.ietf.org/


```
$ curl -fsSLO https://www.rfc-editor.org/rfc/rfc7231.html

$ cat rfc7231.html | pup '.newpage:nth-of-type(4)' | grep -Po '[0-9]{3} [a-zA-Z0-9 -]+' | ruby -anle 'p case when $F[0].match(/^1/);then "1XX";when $F[0].match(/^2/);then "2XX";when $F[0].match(/^3/);then "3XX";when $F[0].match(/^4/);then "4XX";when $F[0].match(/^5/);then "5XX" ;end,$F[0],$F[1..$F.size-1].join("@@@")'|xargs -n3|tr ' ' '\t' | sed 's/@@@/ /g'|sed '1iGrp\t\Code\tName' >http-status-code.tsv

$ cat http-status-code.tsv | awk -v FS='\t' '$0=$2'|tail -n+2>http-status-code-list.txt


$ time cat http-status-code-list.txt | while read code;do sleep $[RANDOM%8+1];curl -fsSLO "https://developer.mozilla.org/ja/docs/Web/HTTP/Status/$code";cat $code | pup 'meta[name="description"] attr{content}'|tr -d \\\n|awk -v code=$code '{print code,$0}' OFS='\t';done | sed '1iCode\tDescription' >http-status-code-description.tsv
curl: (22) The requested URL returned error: 404
cat: 305: そのようなファイルやディレクトリはありません
EOF

real	3m6.085s
user	0m1.319s
sys	0m0.774s

$ ls -lh
合計 12M
-rw-rw-r-- 1 aine aine 369K  9月 13 14:54 100
-rw-rw-r-- 1 aine aine 304K  9月 13 14:54 101
-rw-rw-r-- 1 aine aine 373K  9月 13 14:54 200
-rw-rw-r-- 1 aine aine 367K  9月 13 14:54 201
-rw-rw-r-- 1 aine aine 299K  9月 13 14:54 202
-rw-rw-r-- 1 aine aine 354K  9月 13 14:54 203
-rw-rw-r-- 1 aine aine 359K  9月 13 14:54 204
-rw-rw-r-- 1 aine aine 298K  9月 13 14:54 205
-rw-rw-r-- 1 aine aine 301K  9月 13 14:55 300
-rw-rw-r-- 1 aine aine 375K  9月 13 14:55 301
-rw-rw-r-- 1 aine aine 383K  9月 13 14:55 302
-rw-rw-r-- 1 aine aine 369K  9月 13 14:55 303
-rw-rw-r-- 1 aine aine 381K  9月 13 14:55 307
-rw-rw-r-- 1 aine aine 347K  9月 13 14:55 400
-rw-rw-r-- 1 aine aine 353K  9月 13 14:55 402
-rw-rw-r-- 1 aine aine 366K  9月 13 14:55 403
-rw-rw-r-- 1 aine aine 373K  9月 13 14:55 404
-rw-rw-r-- 1 aine aine 343K  9月 13 14:55 405
-rw-rw-r-- 1 aine aine 380K  9月 13 14:56 406
-rw-rw-r-- 1 aine aine 303K  9月 13 14:56 408
-rw-rw-r-- 1 aine aine 297K  9月 13 14:56 409
-rw-rw-r-- 1 aine aine 365K  9月 13 14:56 410
-rw-rw-r-- 1 aine aine 298K  9月 13 14:56 411
-rw-rw-r-- 1 aine aine 352K  9月 13 14:56 413
-rw-rw-r-- 1 aine aine 340K  9月 13 14:56 414
-rw-rw-r-- 1 aine aine 300K  9月 13 14:56 415
-rw-rw-r-- 1 aine aine 296K  9月 13 14:56 417
-rw-rw-r-- 1 aine aine 297K  9月 13 14:56 426
-rw-rw-r-- 1 aine aine 367K  9月 13 14:56 500
-rw-rw-r-- 1 aine aine 371K  9月 13 14:56 501
-rw-rw-r-- 1 aine aine 366K  9月 13 14:56 502
-rw-rw-r-- 1 aine aine 368K  9月 13 14:57 503
-rw-rw-r-- 1 aine aine 367K  9月 13 14:57 504
-rw-rw-r-- 1 aine aine 294K  9月 13 14:57 505
-rw-rw-r-- 1 aine aine 1.6K  9月 13 15:00 README.md
-rw-rw-r-- 1 aine aine  11K  9月 13 14:57 http-status-code-description.tsv
-rw-rw-r-- 1 aine aine  140  9月 13 14:44 http-status-code-list.txt
-rw-rw-r-- 1 aine aine  810  9月 13 14:43 http-status-code.tsv
-rw-rw-r-- 1 aine aine 295K  9月 13 14:43 rfc7231.html

$ ls [0-9][0-9][0-9]* | xargs rm

$ rm rfc7231.html

$ join -t "$(printf '\011')" -a1 -1 2 -2 1 http-status-code.tsv http-status-code-description.tsv | awk -v FS='\t' '{if(NF==3){print $0,"\t" }else{print $0}}' >http-status-code-with-description.tsv

```
