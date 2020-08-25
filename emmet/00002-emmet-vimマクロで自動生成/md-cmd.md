- IN

```
$ curl -fsSL https://raw.githubusercontent.com/emmetio/emmet/master/snippets/html.json -o emmet-html.json
```

- CMD

```
$ cat emmet-html.json  | jq 'to_entries|map(.key)|group_by(.[:1])|map([((map(.[:1])|unique)[]),.])|map(.[0] as $k|.[1]|map($k+"ZZZ"+.))|flatten[]|splits("ZZZ")'|xargs -n2|awk '{print $1,$2}' OFS="\t" >emmet-html-snippet.tsv
```

- CMD

```
$ cat emmet-html-snippet.tsv | awk 'BEGIN{sep="ZZZ"}{a[$1]=a[$1]sep$2;b[$1]++}END{for(e in a){sub(sep,"",a[e]);print e,b[e],a[e]}}' | sort -k1,2 | ruby -anle 'a=$F[2].split("ZZZ");a.size.times{|e|p $.,e+1,$F[0],a[e]}' | xargs -n4 | awk '{printf "QH%03d\t%03d\t%s\t%s\n" ,$1,$2,$3,$4}' >emmet-html-snippet-pretty.tsv
```

- CMD

```
cat emmet-html-snippet-pretty.tsv | while read grp grpseq key value;do printf "%s-%s-html-snippet.vim\t" $grp $grpseq;echo "let @q=\"i$value\<Esc>:call emmet#expandAbbr(3,\\\"\\\")\<Enter>\"";done >emmet-html-snippet-macro-table.tsv
```

- CMD

```
cat emmetio-html-snippet-pretty.tsv | while read grp grpseq key value;do echo "let @q=\"i$value\<Esc>:call emmet#expandAbbr(3,\\\"\\\")\<Enter>\"">$(printf "%s-%s-emmet-html-snippet-macro.vim\t" $grp $grpseq;);done
```


- CMD

  - 単一実行はこれで行けた

```
$ vim -c "so QH014-001-emmet-html-snippet-macro.vim" -c ":norm @q" -c ':wq! a'



vim便利

$ cat a
<picture></picture>

#!/usr/bin/env bash
vim -c "so QH014-001-emmet-html-snippet-macro.vim" -c ":norm @q" -c ':wq! a' && cat a && rm a


$ bash b.sh
<picture></picture>

```
