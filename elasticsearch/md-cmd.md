- リネーム

```
$ ag -g test2 | ruby -F"\." -anle 'p $F.join("."),"test."+$F[1..$F.size-1].join(".")' | xargs -n2 | xargs -I@ echo git mv @ | bash
```

- 一括置換

```
$ ag test2 -l | xargs perl -pi -e 's/test2/test/g'
```

- 取得件数の確認

```
$ curl -s -X GET "localhost:9200/test-00001-idx/_search?pretty" -H 'Content-Type: application/json' -d'@select-指定した値に等しい.json' | jq '.hits.total.value'
0
```

- リネーム

```
$ ag --nocolor -g select- | ruby -F- -anle 'p "mv",$F.join("-"),$F[0]+format("-%05d-",$.)+$F[1]'|xargs -n3
```

- 型定義作成

  - https://www.elastic.co/guide/en/elasticsearch/reference/7.8/mapping.html

```
$ cat test.txt | ruby -anle 'p "col"+($.-1).to_s,case when $F[0].index(/number/);"number";when $F[0].index(/date|time/);"datetime";else "string";end,$F[0].gsub(/^faker-/,"").gsub(/-ruby$/,""),$F[0]' | xargs -n4 | tr ' ' '\t'>test-type-mapping.tsv

$ cat test-type-mapping.tsv | jq -rRc './"\t"|"\""+.[0]+"\":{\""+("type")+"\":\""+.[1]+"\"}"'|sed 's/^/,/'|tr -d \\\n |sed 's/^,//'>test-type-mapping-placeholder.json

$ sed '/TOBE_REPLACE/r test-type-mapping-placeholder.json' test-type-mapping-template.json >test-type-mapping.json

$ sed -i '/TOBE_REPLACE/d' test-type-mapping.json

$ sudo apt install -y moreutils

$ jq '' test-type-mapping.json | sponge test-type-mapping.json
```
