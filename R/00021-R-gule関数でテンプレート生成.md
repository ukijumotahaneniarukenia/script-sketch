- CMD

```
$Rscript -e 'col1<-c(1:1);col2<-c(1:3);merge(col1,col2)'
```

- OUT

```
  x y
1 1 1
2 1 2
3 1 3
```

- CMD

```
$Rscript -e 'col1<-c(1:1);col2<-c(1:3);merge(col2,col1)'
```

- OUT

```
  x y
1 1 1
2 2 1
3 3 1
```


- CMD

```
$Rscript -e 'col1<-c(1:7);col2<-c(1:3);merge(col1,col2)'
```

- OUT
```
   x y
1  1 1
2  2 1
3  3 1
4  4 1
5  5 1
6  6 1
7  7 1
8  1 2
9  2 2
10 3 2
11 4 2
12 5 2
13 6 2
14 7 2
15 1 3
16 2 3
17 3 3
18 4 3
19 5 3
20 6 3
21 7 3
```

- CMD

```
$Rscript -e 'col1<-c(1:7);col2<-c(1:3);merge(col2,col1)'
```


- OUT

```
   x y
1  1 1
2  2 1
3  3 1
4  1 2
5  2 2
6  3 2
7  1 3
8  2 3
9  3 3
10 1 4
11 2 4
12 3 4
13 1 5
14 2 5
15 3 5
16 1 6
17 2 6
18 3 6
19 1 7
20 2 7
21 3 7
```


- CMD

  - merge関数の戻り値の型はデータフレーム

```
$Rscript -e 'col1<-c(1:7);col2<-c(1:3);class(merge(col1,col2))'
```

- OUT

```
[1] "data.frame"
```
