



- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm<-apply(df,2,sum);sm'
```

- OUT

```
X1 X2 X3
10 26 42
```

- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm<-apply(df,2,sum);rbind(df,sm)'
```

- OUT

```
  X1 X2 X3
1  1  5  9
2  2  6 10
3  3  7 11
4  4  8 12
5 10 26 42
```
