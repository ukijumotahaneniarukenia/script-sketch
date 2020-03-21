- IN

```
```

- CMD
  - 感覚はperlのmap。割と適当。

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm<-apply(df,1,sum);sm'
```

- OUT

```
[1] 15 18 21 24
```

- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm<-apply(df,1,sum);data.frame(df,sm)'
```

- OUT

```
  X1 X2 X3 sm
1  1  5  9 15
2  2  6 10 18
3  3  7 11 21
4  4  8 12 24
```
