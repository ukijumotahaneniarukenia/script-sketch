CMD

package-lock.jsonが存在しているディレクトリに移動

移動後実行

```
$ npmdump-jq
```

CMD

外部ライブラリのメタ情報jsonファイル一覧作成

```
$ cat package-lock.tsv | grep -Po 'https://registry.npmjs.org/.*?tgz'|awk 4|sort |uniq|ruby -F'-/' -anle 'puts $F[0]+"?json"'|sort|uniq>url-list.txt
```

CMD

メタ情報jsonファイルのクロール

バッググランドで実行

907件を1時間20分ぐらい ランダムウェイト10秒

```
$ time bash crawl-package-meta-info-json.sh url-list.txt &

real	78m37.788s
user	1m18.937s
sys	0m13.147s
```

CMD

メタ情報TSVファイルの作成

```
$ time bash create-pacakage-meta-info-tsv.sh
```

```
$ time bash create-pacakage-meta-info-all-tsv.sh
real	0m3.477s
user	0m3.464s
sys	0m0.172s
```

CMD


JSONファイルに変換

```
$ cat pacakage-meta-info-all.json | jq 'map(with_entries(.key|=(gsub("\\.";"_")|gsub("^_+";""))))' | sponge pacakage-meta-info-all.json
```
