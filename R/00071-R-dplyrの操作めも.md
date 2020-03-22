- CMD

```
#!/usr/bin/env Rscript

library(dplyr)

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

listagg<-function(tgt,sep){
  return (paste(tgt,collapse=sep))
}

#集約単位が単一列

##単一の関数を単一列に適用
df

df %>% group_by(grp) %>% summarise_each(list(~ max(.)), dtmdat)

##複数の関数を単一列に適用
df

df %>% group_by(grp) %>% summarise_each(list(~ max(.),~ min(.),~ listagg(.,",")), dtmdat)

##複数の関数を複数列に適用
df

df %>% group_by(grp) %>% summarise_each(list(~ max(.),~ min(.),~ listagg(.,",")), numdat, dtmdat)

#集約単位が複数列

##単一の関数を単一列に適用
df

df %>% group_by(grp,subgrp) %>% summarise_each(list(~ max(.)), dtmdat)

##複数の関数を単一列に適用
df

df %>% group_by(grp,subgrp) %>% summarise_each(list(~ max(.),~ min(.),~ listagg(.,",")), dtmdat)

##複数の関数を複数列に適用
df

df %>% group_by(grp,subgrp) %>% summarise_each(list(~ max(.),~ min(.),~ listagg(.,",")), numdat, dtmdat)

df

df<-df %>%
  filter(grp=="a" & subgrp=="c") %>% #行抽出
  select(c("grp","subgrp","strdat","numdat","dtmdat")) %>% #列選択
  mutate(grp=as.character(grp),subgrp=as.character(subgrp),strdat=as.character(strdat)) %>% #列整形 #型変換 #元列退避
  group_by(grp,subgrp) %>% #グルーピング
  summarise_each(list(~ max(.),~ min(.),~ listagg(.,",")), numdat, dtmdat) #集計・集約

df<-data.frame(df)#データフレーム化

df[,c(grep("grp|subgrp",colnames(df),perl=T),grep("listagg$",colnames(df),perl=T))] #取得列を選定
```
