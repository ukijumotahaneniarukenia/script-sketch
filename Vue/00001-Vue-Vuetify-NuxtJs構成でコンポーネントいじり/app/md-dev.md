```
paste <(for i in /usr/share/mecab/dic/ipadic/Noun*csv;do iconv -f eucjp -t utf8 $i;done|grep 名詞|awk -F, \$0=\$1 | grep -P '^..ナ$') <(cat /dev/urandom | tr -dc '0-9a-zA-Z' | fold -s32 | head -n20) | awk -F '\t' '$2!=""'|jq -R '[split("\t")]|map({"name":.[0],"id":.[1]})[]'|jq -s '' | node -p ''
```
