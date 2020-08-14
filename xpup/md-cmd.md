jsonファイルに変換

```
echo pom.xml | xml2json-ruby
```


フォーマット

```
cat pom.json | jq '' | sponge pom.json
```
