#!/usr/bin/env Rscript

s<-readLines("stdin");
ss<-strsplit(s," ");
sss<-sapply(ss,function(e){
  return(
          c(
            unlist(strsplit(e[1],""))
           ,unlist(strsplit(e[2],""))
          )
        )
})

names(sss)<-c(1:length(sss))

stack(sss)
