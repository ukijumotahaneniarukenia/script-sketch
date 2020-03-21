#!/usr/bin/env Rscript

pacman::p_load(dplyr,pipeR)

numdat <- c(11, 12, 4, 15, 5, 8, 6, 10, 3)
strdat <- c("Y","I","V","D","Q","C","L","R","U")
dtmdat <- seq(Sys.Date(),Sys.Date()+8,1)
grp <- c(rep("a", 4),rep("b", 5))
subgrp <- c(rep("c",2),rep("d",2),rep("c",2),rep("d",3))

#row_number関数
##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_seq=ave(numdat,FUN=row_number)#単一列をソート順に使用
)%>>%arrange(numdat)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_tac_seq=ave(desc(numdat),FUN=row_number)#単一列をソート順に使用
)%>>%arrange(desc(numdat))

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_grpseq=ave(numdat,grp,FUN=row_number)#単一列をソート順に使用
)%>>%arrange(grp,numdat)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_grpseq=ave(desc(numdat),grp,FUN=row_number)#単一列をソート順に使用
)%>>%arrange(grp,desc(numdat))

##grp,subgrp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_subgrpseq=ave(numdat,grp,subgrp,FUN=row_number)#単一列をソート順に使用
)%>>%arrange(grp,subgrp,numdat)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_tac_subgrpseq=ave(desc(numdat),grp,subgrp,FUN=row_number)#単一列をソート順に使用
)%>>%arrange(grp,subgrp,desc(numdat))

##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))#複数列をソート順に使用
           ,num_seq=ave(as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number)),FUN=row_number)
)%>>%arrange(tgtcol)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))#複数列をソート順に使用
           ,num_seq=ave(desc(as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))),FUN=row_number)
)%>>%arrange(desc(tgtcol))

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))#複数列をソート順に使用
           ,num_grpseq=ave(as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number)),grp,FUN=row_number)
)%>>%arrange(grp,tgtcol)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))#複数列をソート順に使用
           ,num_grpseq=ave(desc(as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))),grp,FUN=row_number)
)%>>%arrange(grp,desc(tgtcol))

##grp,subgrp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))#複数列をソート順に使用
           ,num_subgrpseq=ave(as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number)),grp,subgrp,FUN=row_number)
)%>>%arrange(grp,subgrp,tgtcol)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))
           ,num_subgrpseq=ave(desc(as.integer(ave(numdat,FUN=row_number))+as.integer(ave(strdat,FUN=row_number))),grp,subgrp,FUN=row_number)
)%>>%arrange(grp,subgrp,desc(tgtcol))


#lag関数(1行前のみ指定できる)
##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lag_numdat=ifelse(is.na(ave(numdat,FUN=lag)),0,ave(numdat,FUN=lag))#順序保持される
)

###降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lag_numdat=ifelse(is.na(ave(desc(numdat),FUN=lag)),0,ave(desc(numdat),FUN=lag))
)

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lag_numdat=ifelse(is.na(ave(numdat,grp,FUN=lag)),0,ave(numdat,grp,FUN=lag))#順序保持される
)

###降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lag_numdat=ifelse(is.na(ave(desc(numdat),grp,FUN=lag)),0,ave(desc(numdat),grp,FUN=lag))
)


#lead関数(1行後のみ指定できる)
##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lead_numdat=ifelse(is.na(ave(numdat,FUN=lead)),999,ave(numdat,FUN=lead))#順序保持される
)

###降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lead_numdat=ifelse(is.na(ave(desc(numdat),FUN=lead)),999,ave(desc(numdat),FUN=lead))#順序保持される
)

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lead_numdat=ifelse(is.na(ave(numdat,grp,FUN=lead)),999,ave(numdat,grp,FUN=lead))#順序保持される
)

###降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,lead_numdat=ifelse(is.na(ave(desc(numdat),grp,FUN=lead)),999,ave(desc(numdat),grp,FUN=lead))#順序保持される
)

#自作関数listagg

listagg<-function(tgt){
  return (paste(unique(tgt),collapse=","))
}

##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,listagg_numdat=ave(numdat,FUN=listagg)
)%>>%arrange(numdat)

#降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,listagg_numdat=ave(desc(numdat),FUN=listagg)
)%>>%arrange(desc(numdat))

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,listagg_grp_numdat=ave(numdat,grp,FUN=listagg)
)%>>%arrange(grp,numdat)

#降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,listagg_grp_numdat=ave(desc(numdat),grp,FUN=listagg)
)%>>%arrange(grp,desc(numdat))


#min,max関数
##全行単位
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,mn_strdat=ave(strdat,FUN=min)
           ,mx_strdat=ave(strdat,FUN=max)
           ,mn_numdat=ave(numdat,FUN=min)
           ,mx_numdat=ave(numdat,FUN=max)
           ,mn_dtmdat=ave(dtmdat,FUN=min)
           ,mx_dtmdat=ave(dtmdat,FUN=max)
)

##grp単位
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,mn_strdat=ave(strdat,grp,FUN=min)
           ,mx_strdat=ave(strdat,grp,FUN=max)
           ,mn_numdat=ave(numdat,grp,FUN=min)
           ,mx_numdat=ave(numdat,grp,FUN=max)
           ,mn_dtmdat=ave(dtmdat,grp,FUN=min)
           ,mx_dtmdat=ave(dtmdat,grp,FUN=max)
)

#dense_rank関数
##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank))#複数列をソート順に使用
           ,num_seq=ave(as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank)),FUN=dense_rank)
)%>>%arrange(tgtcol)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank))#複数列をソート順に使用
           ,num_seq=ave(desc(as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank))),FUN=dense_rank)
)%>>%arrange(desc(tgtcol))

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank))#複数列をソート順に使用
           ,num_grpseq=ave(as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank)),grp,FUN=dense_rank)
)%>>%arrange(grp,tgtcol)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,tgtcol=as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank))#複数列をソート順に使用
           ,num_grpseq=ave(desc(as.integer(ave(numdat,FUN=dense_rank))+as.integer(ave(strdat,FUN=dense_rank))),grp,FUN=dense_rank)
)%>>%arrange(grp,desc(tgtcol))

#sum関数
##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_seq=ave(numdat,FUN=sum)#単一列をソート順に使用
)%>>%arrange(numdat)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_tac_seq=ave(desc(numdat),FUN=sum)#単一列をソート順に使用
)%>>%arrange(desc(numdat))

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_grpseq=ave(numdat,grp,FUN=sum)#単一列をソート順に使用
)%>>%arrange(grp,numdat)

###降順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_grpseq=ave(desc(numdat),grp,FUN=sum)#単一列をソート順に使用
)%>>%arrange(grp,desc(numdat))

#cumsum関数
##全行単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_seq=ave(numdat,FUN=cumsum)#指定した単一列ではなく、日付列をソート順に使用
)
# %>>%arrange(numdat)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_seq=ave(dtmdat,FUN=cumsum)#指定した単一列ではなく、日付列をソート順に使用
)
#Error in Math.Date(x) : cumsum not defined for "Date" objects
#なぞ
# %>>%arrange(numdat)

###降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_tac_seq=ave(desc(numdat),FUN=cumsum)#指定した単一列ではなく、日付列をソート順に使用
)
# %>>%arrange(desc(numdat))

data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_tac_seq=ave(desc(dtmdat),FUN=cumsum)#指定した単一列ではなく、日付列をソート順に使用
)
#
# %>>%arrange(desc(numdat))

##grp単位
###昇順
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_grpseq=ave(numdat,grp,FUN=cumsum)#指定した単一列ではなく、日付列をソート順に使用
)
# %>>%arrange(grp,numdat)

###降順(なぜかマイナスになる。よくわからん。)
data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
           ,num_grpseq=ave(desc(numdat),grp,FUN=cumsum)#指定した単一列ではなく、日付列をソート順に使用
)
# %>>%arrange(grp,desc(numdat))
