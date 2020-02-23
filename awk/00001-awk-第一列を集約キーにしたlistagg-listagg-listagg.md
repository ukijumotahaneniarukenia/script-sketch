- IN

```
$cat test.tsv
href=/shiozaki href=/shiozaki/items/1fbab58b26fe3f6cf9ad href=/tags/git href=/tags/peco 2016-08-18 ApacheSolrを使った検索サジェスターの作り方まとめ
href=/miyae href=/miyae/items/b5ad6c2ac446bf82110b href=/tags/apache href=/tags/qiita href=/tags/rails href=/tags/ruby href=/tags/solr 2018-07-02 ApacheSolr設定メモ
href=/hirohiro77 href=/hirohiro77/items/973b500bda7a52cf56b8 href=/miyae/items/b5ad6c2ac446bf82110b href=/tags/postgresql href=/tags/solr 2016-04-22 ApacheSolrの導入とWikipadiaのデータの取り込み
href=/Satachito href=/Satachito/items/baf974caab537011fd5f href=/tags/%E5%85%A8%E6%96%87%E6%A4%9C%E7%B4%A2 href=/tags/solr href=/tags/wikipedia 2016-05-17 Solr6.0をインストール/Wikipediaのインポート
href=/remin href=/remin/items/a726128ab388cb73d9ee href=/tags/lucene href=/tags/macosx href=/tags/solr 2018-05-18 WSLからマウントしたWindowsのドライブでchmodしたい
```

- DETERMINE
```
$cat test.tsv | grep -n -Po 'href=/tags/[0-9a-zA-Z%]+' | perl -pe 's;href=/tags/;;' | awk -v FS=':' '{F[$1]=F[$1] DEL[$1] $2;DEL[$1]=","}{print $1,$2}'
1 git
1 peco
2 apache
2 qiita
2 rails
2 ruby
2 solr
3 postgresql
3 solr
4 %E5%85%A8%E6%96%87%E6%A4%9C%E7%B4%A2
4 solr
4 wikipedia
5 lucene
5 macosx
5 solr
```

- CMD

  - https://www.unix.com/shell-programming-and-scripting/266869-implementing-listagg-like-function-shell.html
  - awkのkeyは重複を許さないのはperlのそれと同じ

```
$cat test.tsv | grep -n -Po 'href=/tags/[0-9a-zA-Z%]+' | perl -pe 's;href=/tags/;;' | awk -v FS=':' '{F[$1]=F[$1] DEL[$1] $2;DEL[$1]=","}END{for(key in F){print key,F[key]}}' | sort -nk1
```

- OUT
```
1 git,peco
2 apache,qiita,rails,ruby,solr
3 postgresql,solr
4 %E5%85%A8%E6%96%87%E6%A4%9C%E7%B4%A2,solr,wikipedia
5 lucene,macosx,solr
```
