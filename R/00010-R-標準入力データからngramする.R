#!/usr/bin/env Rscript

usage<-function(status){
  file_name<-gsub("--file=","",commandArgs()[4])
  print("Usage:")
  print(paste("$cat test2.txt | ",file_name," 1"))
  print("or")
  print(paste("$cat test2.txt | ",file_name," 2"))
  print("or")
  print(paste("$cat test2.txt | ",file_name," 3"))
  quit(status=status)
}

args<-commandArgs(trailingOnly=TRUE)[1]
nnn<-as.integer(args)
if(is.na(nnn)){
  usage(1);
}
if(0 >= nnn){
  usage(1);
}

tgt <- readLines('stdin')
for(vec_idx in 1:length(tgt)){
  gram<-strsplit(tgt[vec_idx],"")
  for(gram_idx in 1:length(gram[[1]])){
    print(c(tgt[vec_idx],substr(tgt[vec_idx],gram_idx,gram_idx+(nnn-1)),vec_idx,gram_idx))
  }
}
