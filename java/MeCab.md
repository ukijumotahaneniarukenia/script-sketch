- MeCab.crosstab.tsvファイルを作るとき

  - クロス集計

```
cat MeCab.tsv | awk '{$1=$2=$5=$6="";print $0}'| awk -vOFS='\t' '{print $1"-"$2,$3,$4}' | datamash -s crosstab 1,2 unique 3 | sed '1s/^/行番号/'>MeCab.crosstab.tsv
```
