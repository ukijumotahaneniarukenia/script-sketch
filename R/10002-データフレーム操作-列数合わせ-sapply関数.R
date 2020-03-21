#!/usr/bin/env Rscript

#マスタベクタの作成
mst_col <- c("col1","col2","col3")

#名前付きトランベクタの作成
d1 <- c("col1"=1,"col2"=2,"col3"=3)
d2 <- c("col1"=1,"col3"=3)
d3 <- c("col2"=2,"col3"=3)

#型検査
is.vector(d1)#TRUE
is.list(d1)#FALSE

#リスト化
liz <- list(d1, d2, d3)

is.list(liz)#TRUE

liz
length(liz)#要素数

liz[[1]]
length(liz[[1]])#ベクタ数

liz[[1]]["col1"]#1
liz[[1]]["col2"]#2
liz[[1]]["col3"]#3

rt <- data.frame()#データフレーム初期化
for(i in 1:length(liz)){
  tmp <- sapply(mst_col, function(col){#sapplyで各要素に紐づく全ベクタごとに一括処理
    ifelse(col %in% names(liz[[i]]), liz[[i]][[col]], NA)#トランベクタの名前付きベクタ名がマスタベクタに存在する場合は、その名前に紐づくベクタ値を、なければNAを返却
  })
  rt <- bind_rows(rt, tmp)
}
colnames(rt) <- mst_col#マスタベクタ名でカラム名振り直し
print(rt)#出力
