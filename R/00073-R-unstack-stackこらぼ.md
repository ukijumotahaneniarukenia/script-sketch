- CMD
  - リストに名前つけておくのが重要
```
$cat test.tsv
apple	banana	orange
100	200	300
A	B	C


$cat test.tsv | Rscript -e 's<-readLines("stdin");ss<-strsplit(s,"\t");ss'
[[1]]
[1] "apple"  "banana" "orange"

[[2]]
[1] "100" "200" "300"

[[3]]
[1] "A" "B" "C"

$cat test.tsv | Rscript -e 's<-readLines("stdin");ss<-strsplit(s,"\t");names(ss)<-c(1:length(ss))'
#リストに名前つけておくのが重要
$cat test.tsv | Rscript -e 's<-readLines("stdin");ss<-strsplit(s,"\t");names(ss)<-c(1:length(ss));ss'
$`1`
[1] "apple"  "banana" "orange"

$`2`
[1] "100" "200" "300"

$`3`
[1] "A" "B" "C"

$cat test.tsv | Rscript -e 's<-readLines("stdin");ss<-strsplit(s,"\t");names(ss)<-c(1:length(ss));stack(ss)'
  values ind
1  apple   1
2 banana   1
3 orange   1
4    100   2
5    200   2
6    300   2
7      A   3
8      B   3
9      C   3
$cat test.tsv | Rscript -e 's<-readLines("stdin");ss<-strsplit(s,"\t");names(ss)<-c(1:length(ss));unstack(stack(ss))'
      X1  X2 X3
1  apple 100  A
2 banana 200  B
3 orange 300  C

$cat test.tsv | Rscript -e 's<-readLines("stdin");ss<-strsplit(s,"\t");names(ss)<-c(1:length(ss));data.frame(t(unstack(stack(ss))))'
      X1     X2     X3
X1 apple banana orange
X2   100    200    300
X3     A      B      C
```
