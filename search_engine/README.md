# script-search

tango-list-file.txtファイルにインデックス付けしたいキーワードを登録

```
$ cat tango-list-file.txt
取得
抽出
削除
更新
作成
うんこ
```

登録後、以下のスクリプトを実行

標準出力に出力されるので、リダイレクトでファイルに結果を出力する

tsv形式で出力

```
$ time ./Z00-全文検索インデックス作成.sh script-env >transpose-index.tsv

real	0m3.635s
user	0m4.339s
sys	0m0.980s
```
