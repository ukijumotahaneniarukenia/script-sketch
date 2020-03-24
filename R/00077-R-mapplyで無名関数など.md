- CMD

```
$Rscript -e 'a<-c(1:10);b<-c(10:1);print(a);print(b);print(a+b)'
```

- OUT

```
 [1]  1  2  3  4  5  6  7  8  9 10
 [1] 10  9  8  7  6  5  4  3  2  1
 [1] 11 11 11 11 11 11 11 11 11 11
```


- CMD

```
$Rscript -e 'a<-c(1:10);b<-c(10:1);mapply(function(x,y){return(x+y)},a,b)'
```

- OUT

```
 [1] 11 11 11 11 11 11 11 11 11 11
```


- CMD
  - 無名にしなくてもOK

```
$Rscript -e 'a<-c(1:10);b<-c(10:1);ppp<-function(x,y){return(x+y)};mapply(ppp,a,b)'
```


- OUT

```
 [1] 11 11 11 11 11 11 11 11 11 11
```
