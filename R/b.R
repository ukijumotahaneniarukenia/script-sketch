#!/usr/bin/env Rscript

library(lubridate);

usage<-function(status){
  file_name<-gsub("--file=","",commandArgs()[4])
  print("Usage:")
  print(paste("$",file_name," 2019-02-05 04:50:20"))
  quit(status=status)
}

args<-commandArgs(trailingOnly=TRUE)[1]
nnn<-ymd_hms(args)

if(!is.na(nnn)){
  base_dtm<-nnn
}else{
  base_dtm<-now()
}

c<-seq(0,60,1);
cc<-lapply(c,function(e){
  return (
          c(
             as.character(e+base_dtm)
            ,year(e+base_dtm)
            ,month(e+base_dtm)
            ,day(e+base_dtm)
            ,hour(e+base_dtm)
            ,minute(e+base_dtm)
            ,round(second(e+base_dtm))
           )
         )
});

df<-data.frame()
for(list_idx in 1:length(cc)){
  df<-rbind(df,t(data.frame(c(list_idx,cc[[list_idx]]))))
}
rownames(df)<-c(1:nrow(df))
colnames(df)<-c("行番号","日付","年","月","日","時","分","秒")
df
