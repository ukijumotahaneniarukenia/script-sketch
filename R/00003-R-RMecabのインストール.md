- LIB
  - http://rmecab.jp/wiki/index.php?RMeCab

- CMD
  - rootユーザーで実行
```
$Rscript -e 'install.packages("RMeCab", repos = "https://rmecab.jp/R",type = "source", dependencies = TRUE, Ncpus = getOption("Ncpus", 12L))'
```

- CMD

```
$Rscript -e 'library(RMeCab);res <- RMeCabC("すもももももももものうち");print(unlist(res))'
```

- OUT

```
    名詞     助詞     名詞     助詞     名詞     助詞     名詞
"すもも"     "も"   "もも"     "も"   "もも"     "の"   "うち"
```
