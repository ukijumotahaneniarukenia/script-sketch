CMD

外部ライブラリのメタ情報jsonファイルをダウンロード

```
$ curl -fsSL https://registry.npmjs.org/prepend-http?json -o- | jq '' >prepend-http.json
```

CMD

キーバリュー形式に変換、きれいに表示するため、ダブルクォートをエスケープ

githubのビュワーでいい感じに表示させるために必要

```
$ echo prepend-http.json | json2kv-jq | sed -r 's/\x22/\x22\x22/g' | awk -v FS='\t' '{print "\x22"$1"\x22","\x22"$2"\x22"}' OFS='\t' >prepend-http-kv.tsv
```

CMD

いいかんじにkv.tsvファイルを眺めたあと、以下のコマンドを使い分け


共通項目の取得（デフォルト）

```
$ cat prepend-http.json | jq -r '. as $in | "versions" as $version_main_path | ($in|.time|to_entries|map(select(.key != "modified" and .key != "created"))) as $time_info | ($in|.versions|to_entries|map(.key as $version_sub_path|$in[$version_main_path][$version_sub_path]|.version as $version|[.name,.version,."description",."license",."repository"."url",."author"."name",."author"."email",."author"."url",."_npmVersion",."_nodeVersion",."dist"."shasum",."dist"."tarball",($time_info|map(select(.key==$version))[].value)]))[]|@tsv'|sed '1i.name\t.version\t.description\t.license\t.repository.url\t.author.name\t.author.email\t.author.url\t._npmVersion\t._nodeVersion\t.dist.shasum\t.dist.tarball\ttime'>prepend-http-common.tsv
```

キーワードあり

```
$ cat prepend-http.json | jq -r '. as $in | "versions" as $version_main_path |"keywords" as $keyword_main_path | ($in|.time|to_entries|map(select(.key != "modified" and .key != "created"))) as $time_info | ($in|.versions|to_entries|map(.key as $version_sub_path | [range(0;($in[$version_main_path][$version_sub_path][$keyword_main_path]|length))]|map(. as $idx|($in[$version_main_path][$version_sub_path])|.version as $version|[.name,.version,."description",."license",."repository"."url",."author"."name",."author"."email",."author"."url",."_npmVersion",."_nodeVersion",."dist"."shasum",."dist"."tarball",.[$keyword_main_path][$idx],($time_info|map(select(.key==$version))[]|.value)])))[][]|@tsv'|sed '1i.name\t.version\t.description\t.license\t.repository.url\t.author.name\t.author.email\t.author.url\t._npmVersion\t._nodeVersion\t.dist.shasum\t.dist.tarball\tkeyword\ttime'>prepend-http-with-keywords.tsv
```

CMD

参照回数トップN件

```
$ cat package-lock.tsv | grep -Po 'https://registry.npmjs.org/.*?tgz'|awk 4|sort|uniq -c|sort -nrk1|head -n30|awk '{print $1,$2}' OFS='\t'
```
