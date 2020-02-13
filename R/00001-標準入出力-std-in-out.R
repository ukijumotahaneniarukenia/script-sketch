#!/usr/bin/env Rscript

usage<-function(status){
  print("Usage:")
  quit(status=status)
}

main<-function(status){
  args<-commandArgs(trailingOnly=TRUE)[1]

  if(!is.na(args)){
    usage(1);
  }

  input<-read.csv('stdin',header=FALSE)
  #print(as.character(input[["V1"]]))
  print(strsplit(as.character(input[["V1"]])," "))
  #print(input)
  quit(status=status)
}

main(0)
