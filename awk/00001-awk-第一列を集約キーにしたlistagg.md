- IN

```
$cat test.txt
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
$cat test.txt | awk -v FS=':' '{F[$1]=F[$1] DEL[$1] $2;DEL[$1]=","}END{for(key in F){print key,F[key]}}' | sort -nk1
```

- OUT
```
1 git,peco
2 apache,qiita,rails,ruby,solr
3 postgresql,solr
4 %E5%85%A8%E6%96%87%E6%A4%9C%E7%B4%A2,solr,wikipedia
5 lucene,macosx,solr
```
