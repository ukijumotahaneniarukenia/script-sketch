#!/usr/bin/env Rscript

usage<-function(status){
  file_name<-gsub("--file=","",commandArgs()[4])
  print("Usage:")
  print(paste("$time cat test-non-head.csv |",file_name))
  quit(status=status)
}

args<-commandArgs(trailingOnly=TRUE)[1]

if(!is.na(args)){
  usage(1);
}

input<-read.csv('stdin',header=FALSE,sep=',')

print(input)
