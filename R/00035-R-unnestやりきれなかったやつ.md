- IN

```
$parallel echo :::: test2.txt ::: ABC | ./a.R  2>/dev/null
```


- CMD
  - ラテラル感でない。ラテラル感はsapplyか。。。
```
#!/usr/bin/env Rscript

library(dplyr)
library(tidyr)

s<-readLines("stdin");
ss<-strsplit(s," ");
sss<-sapply(ss,function(e){return (e)});
ssss<-t(sss);

df<-data.frame(c(1:nrow(data.frame(ssss))),data.frame(ssss))

colnames(df)<-c("grp","tgt","suffix")

dfdf<-df %>%
  mutate(pretgt=tgt) %>% #unnestまえに元の値を退避
  transform(tgt=strsplit(as.character(tgt),"")) %>% #unnest用に構造変換
  unnest(tgt)

colnames(dfdf)<-c("grp","gram","suffix","tgt")

data.frame(dfdf)
```


- OUT

```
   grp gram suffix                tgt
1    1   救    ABC           救急車。
2    1   急    ABC           救急車。
3    1   車    ABC           救急車。
4    1   。    ABC           救急車。
5    2   ふ    ABC ふくへいはじめて。
6    2   く    ABC ふくへいはじめて。
7    2   へ    ABC ふくへいはじめて。
8    2   い    ABC ふくへいはじめて。
9    2   は    ABC ふくへいはじめて。
10   2   じ    ABC ふくへいはじめて。
11   2   め    ABC ふくへいはじめて。
12   2   て    ABC ふくへいはじめて。
13   2   。    ABC ふくへいはじめて。
```

- IN

```
$parallel echo :::: test2.txt ::: {ABC,DEF} | ./a.R 2>/dev/null
```


- CMD

```
#!/usr/bin/env Rscript

library(dplyr)
library(tidyr)

s<-readLines("stdin");
ss<-strsplit(s," ");
sss<-sapply(ss,function(e){return (e)});
ssss<-t(sss);

df<-data.frame(c(1:nrow(data.frame(ssss))),data.frame(ssss))

colnames(df)<-c("grp","tgt","suffix")

dfdf<-df %>%
  mutate(pretgt=tgt) %>% #unnestまえに元の値を退避
  transform(tgt=strsplit(as.character(tgt),"")) %>% #unnest用に構造変換
  unnest(tgt)

colnames(dfdf)<-c("grp","gram","suffix","tgt")

data.frame(dfdf)
```


- OUT

```
   grp gram suffix                tgt
1    1   救    ABC           救急車。
2    1   急    ABC           救急車。
3    1   車    ABC           救急車。
4    1   。    ABC           救急車。
5    2   救    DEF           救急車。
6    2   急    DEF           救急車。
7    2   車    DEF           救急車。
8    2   。    DEF           救急車。
9    3   ふ    ABC ふくへいはじめて。
10   3   く    ABC ふくへいはじめて。
11   3   へ    ABC ふくへいはじめて。
12   3   い    ABC ふくへいはじめて。
13   3   は    ABC ふくへいはじめて。
14   3   じ    ABC ふくへいはじめて。
15   3   め    ABC ふくへいはじめて。
16   3   て    ABC ふくへいはじめて。
17   3   。    ABC ふくへいはじめて。
18   4   ふ    DEF ふくへいはじめて。
19   4   く    DEF ふくへいはじめて。
20   4   へ    DEF ふくへいはじめて。
21   4   い    DEF ふくへいはじめて。
22   4   は    DEF ふくへいはじめて。
23   4   じ    DEF ふくへいはじめて。
24   4   め    DEF ふくへいはじめて。
25   4   て    DEF ふくへいはじめて。
26   4   。    DEF ふくへいはじめて。
```
