- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm_row<-apply(df,1,sum);sm_row'
```

- OUT

```
[1] 15 18 21 24
```


- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm_row<-apply(df,1,sum);sm_col<-apply(df,2,sum);sm_col'
```


- OUT

```
X1 X2 X3
10 26 42
```

- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm_row<-apply(df,1,sum);sm_col<-apply(df,2,sum);c(sm_col,sum(sm_col))'
```

- OUT

```
X1 X2 X3
10 26 42 78
```

- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm_row<-apply(df,1,sum);sm_col<-apply(df,2,sum);n<-c(sm_col,sum(sm_col));data.frame(df,sm_row)'
```



- OUT

```
  X1 X2 X3 sm_row
1  1  5  9     15
2  2  6 10     18
3  3  7 11     21
4  4  8 12     24
```

- CMD

```
$Rscript -e 'mtx<-matrix(c(1:12), nrow=4, ncol=3);df<-data.frame(mtx);sm_row<-apply(df,1,sum);sm_col<-apply(df,2,sum);n<-c(sm_col,sum(sm_col));nn<-data.frame(df,sm_row);rbind(nn,n)'
```

- OUT

```
  X1 X2 X3 sm_row
1  1  5  9     15
2  2  6 10     18
3  3  7 11     21
4  4  8 12     24
5 10 26 42     78
```
