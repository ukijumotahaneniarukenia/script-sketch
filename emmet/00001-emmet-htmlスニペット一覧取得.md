- IN

```
$ curl -fsSLO https://raw.githubusercontent.com/emmetio/emmet/master/snippets/html.json
```


- CMD

```
$ cat html.json  | jq 'to_entries|map(.key)|group_by(.[:1])|map([((map(.[:1])|unique)[]),.])|map(.[0] as $k|.[1]|map($k+"ZZZ"+.))|flatten[]|splits("ZZZ")'|xargs -n2|awk '{print $1,$2}' OFS="\t" >html-snippet.tsv
```
