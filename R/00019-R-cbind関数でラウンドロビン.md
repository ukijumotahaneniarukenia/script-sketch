- IN

```
$Rscript -e 'col1<-c(1:1);col1'
[1] 1
$Rscript -e 'col2<-c(1:3);col2'
[1] 1 2 3
```

- CMD
  - 単位元であるパタン

```
$Rscript -e 'col1<-c(1:1);col2<-c(1:3);mtx<-cbind(col2,col1);mtx'
```

- OUT

```
     col2 col1
[1,]    1    1
[2,]    2    1
[3,]    3    1
```

- CMD
  - 単位元であるパタン

```
$Rscript -e 'col1<-c(1:1);col2<-c(1:3);mtx<-cbind(col1,col2);mtx'
```

- OUT

```
     col1 col2
[1,]    1    1
[2,]    1    2
[3,]    1    3
```

- CMD
  - 単位元でないパタン

```
$Rscript -e 'col1<-c(1:7);col2<-c(1:3);mtx<-cbind(col1,col2);mtx'
```


- OUT

```
 警告メッセージ:
 cbind(col1, col2) で:
  number of rows of result is not a multiple of vector length (arg 2)
     col1 col2
[1,]    1    1
[2,]    2    2
[3,]    3    3
[4,]    4    1
[5,]    5    2
[6,]    6    3
[7,]    7    1
```

- CMD
  - 単位元でないパタン
```
$Rscript -e 'col1<-c(1:7);col2<-c(1:3);mtx<-cbind(col2,col1);mtx'
```


- OUT

```
 警告メッセージ:
 cbind(col2, col1) で:
  number of rows of result is not a multiple of vector length (arg 1)
     col2 col1
[1,]    1    1
[2,]    2    2
[3,]    3    3
[4,]    1    4
[5,]    2    5
[6,]    3    6
[7,]    1    7
```


- CMD
  - 警告メッセージをミュートする場合

```
$Rscript -e 'col1<-c(1:7);col2<-c(1:3);mtx<-cbind(col1,col2);mtx' 2>/dev/null
```

- OUT

```
     col1 col2
[1,]    1    1
[2,]    2    2
[3,]    3    3
[4,]    4    1
[5,]    5    2
[6,]    6    3
[7,]    7    1
```
