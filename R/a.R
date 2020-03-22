#!/usr/bin/env Rscript

library(dplyr)

s<-readLines("stdin");
ss<-strsplit(s," ");
sss<-lapply(ss,function(e){
  return(
          c(
            e
            ,strsplit(e,"")
          )
        )
})

df<-data.frame()
for(list_idx in 1:length(sss)){
  names(sss[[list_idx]])<-c(paste(list_idx,1:length(sss[[list_idx]]),sep="-"))
  df<-rbind(df,stack(sss[[list_idx]]))
}
colnames(df)<-c("tgt","grp")

df<-subset(df,TRUE,c("grp","tgt")) #列位置を入れ替える

df<-df %>%
  mutate(subgrp=gsub("^\\d-","",grp)) %>%
  mutate(grp=gsub("-\\d$","",grp)) %>%
  subset(TRUE,c("grp","subgrp","tgt")) %>%
  group_by(grp,subgrp) %>%
  summarise(liz=paste(tgt,collapse=","),cnt=n())

df<-data.frame(df)

df[,grep(c("^grp$"),colnames(df),invert=T)] #grp列以外の取得
