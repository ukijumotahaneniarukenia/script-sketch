#!/usr/bin/env Rscript

usage<-function(status){
  file_name<-gsub("--file=","",commandArgs()[4])
  print("Usage:")
  print(paste("$time seq 100000 | xargs -n10 |",file_name," 1>/dev/null"))
  print("real	0m11.526s")
  print("user	0m10.624s")
  print("sys	0m1.583s")
  quit(status=status)
}

main<-function(status){
  args<-commandArgs(trailingOnly=TRUE)[1]

  if(!is.na(args)){
    usage(1);
  }

  input<-read.csv('stdin',header=FALSE)

  liz<-strsplit(as.character(input[["V1"]])," ")

  rt<-data.frame()
  for(idx in 1:length(liz)){
    tmp<-c()
    colname<-c()
    for(ele in 1:length(liz[[1]])){
      tmp<-c(tmp,liz[[idx]][ele])
      colname<-c(colname,paste("col",ele,sep=""))
    }
    rt<-rbind(rt,tmp,stringsAsFactors=FALSE)
  }
  colnames(rt)<-colname
  print(rt)
  quit(status=status)
}

main(0)
