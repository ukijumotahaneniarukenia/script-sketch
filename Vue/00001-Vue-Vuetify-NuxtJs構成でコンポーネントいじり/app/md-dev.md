```
paste <(for i in /usr/share/mecab/dic/ipadic/Noun*csv;do iconv -f eucjp -t utf8 $i;done|grep 名詞|awk -F, \$0=\$1 | grep -P '^..ナ$') <(cat /dev/urandom | tr -dc '0-9a-zA-Z' | fold -s32 | head -n20) | awk -F '\t' '$2!=""'|jq -R '[split("\t")]|map({"name":.[0],"id":.[1]})[]'|jq -s '' | node -p ''
```

```
$ paste <(for i in /usr/share/mecab/dic/ipadic/Noun*csv;do iconv -f eucjp -t utf8 $i;done|grep 名詞|awk -F, \$0=\$1 | grep -P '^..ナ$'|head -n3) <(cat /dev/urandom | tr -dc '0-9a-zA-Z' | fold -s32 | head -n3) | awk -F '\t' '$2!=""' | while read n u;do paste -d' ' <(yes "$n $u"|head -n3) <(cat /dev/urandom | tr -dc '0-9a-zA-Z' | fold -s32 | head -n3);done | jq -R '[split(" ")]|map({"name":.[0],"userId":.[1],"dataId":.[2]})[]'|jq -s '' >a.json
```


```
$ cat a.json | json2object-node.js
```
