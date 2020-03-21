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
