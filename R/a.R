#!/usr/bin/env Rscript

listagg<-function(tgt){
  return (paste(unique(tgt),collapse=","))
}

numdat <- c(11, 12, 4, 15, 5, 8, 6, 10, 3)
strdat <- c("Y","I","V","D","Q","C","L","R","U")
dtmdat <- seq(Sys.Date(),Sys.Date()+8,1)
grp <- c(rep("a", 4),rep("b", 5))
subgrp <- c(rep("c",2),rep("d",2),rep("c",2),rep("d",3))

df<-data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
)

df

mtx<-t(t(tapply(df$numdat,paste(df$grp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp,df$subgrp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp),sum)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp,df$subgrp),sum)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp),max)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp,df$subgrp),max)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp),min)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$numdat,paste(df$grp,df$subgrp),min)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp,df$subgrp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp),max)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp,df$subgrp),max)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp),min)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp,df$subgrp),min)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$strdat,paste(df$grp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(df$strdat,paste(df$grp,df$subgrp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$strdat),paste(df$grp),max)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$strdat),paste(df$grp,df$subgrp),max)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$strdat),paste(df$grp),min)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$strdat),paste(df$grp,df$subgrp),min)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf
