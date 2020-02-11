install.packages("pacman")
pacman::p_load(stringr,dplyr)

#ある関数の戻り値の型を調べるために、一度変数代入
x<-installed.packages()
#型検査-is
is.vector(x)
is.matrix(x)
is.array(x)
is.list(x)
is.data.frame(x)
is.factor(x)
is.ordered(x)
#型変換-as

#typeof(),class()で取得できた型結果で変換

#上記の結果がTRUEになった型をデータフレーム型に変換する
xx<-as.data.frame(x)
#行名削除(いろいろやり方あるが、変わらないこともあったので、これで)
rownames(xx)<-1:nrow(xx)
#TRUEになったことを確認
is.data.frame(xx)

#http://taustation.com/r-datafrrame-display-modification/
#行数確認
nrow(xx)
#列数確認
ncol(xx)
#行数・列数確認
dim(xx)

#列名確認
colnames(xx)
#行名確認
rownames(xx)

#基本的にベクタ型ないしはデータフレーム型として整形してから作業を行う必要がある。
#なにがしかの処理結果に対して必ず型チェックをおこなう。
#そういう方針がハンディ。

#データフレームの列名を絞って検索
subset(xx,TRUE,c(Version,Package))

#単一列データフレームで重複排除前一覧取得
subset(xx,TRUE,c(Version))

#単一列データフレームで重複排除後一覧取得
unique(subset(xx,TRUE,c(Version)))

#複数列データフレームで重複排除前一覧取得
subset(xx,TRUE,c(Version,Package))

#複数列データフレームで重複排除後一覧取得
unique(subset(xx,TRUE,c(Version,Package)))

#単一列データフレーム重複排除前件数取得
nrow(subset(xx,TRUE,c(Version)))

#単一列データフレーム重複排除後件数取得
nrow(unique(subset(xx,TRUE,c(Version))))

#複数列データフレーム重複排除前件数取得
nrow(subset(xx,TRUE,c(Version,Package)))

#複数列データフレーム重複排除後件数取得
nrow(unique(subset(xx,TRUE,c(Version,Package))))

#ベクタ重複排除前要素数取得
length(as.character(xx$Version))
#ベクタ重複排除後要素数取得
length(unique(as.character(xx$Version)))

#データフレームのカラム名を一括調査
typ<-as.character(sapply(xx,class))

#別名管理マスタ
x<-installed.packages()#インストール済みパッケージを行列で取得
xx<-as.data.frame(x)#行列型をデータフレーム型に変換
rownames(xx)<-1:nrow(xx)#行ラベルに行番号を付与
y<-subset(xx,TRUE,c(Version,Package))#取得列を選択して取得
colnames(y) <- c("ver","pkg")#取得列に別名を付与

#先頭からX件
x<-installed.packages()#インストール済みパッケージを行列で取得
xx<-as.data.frame(x)#行列型をデータフレーム型に変換
rownames(xx)<-1:nrow(xx)#行ラベルに行番号を付与
y<-subset(xx,TRUE,c(Version,Package))#取得列を選択して取得
colnames(y) <- c("ver","pkg")#取得列に別名を付与
head(y,10)

#末尾からX件
x<-installed.packages()#インストール済みパッケージを行列で取得
xx<-as.data.frame(x)#行列型をデータフレーム型に変換
rownames(xx)<-1:nrow(xx)#行ラベルに行番号を付与
y<-subset(xx,TRUE,c(Version,Package))#取得列を選択して取得
colnames(y) <- c("ver","pkg")#取得列に別名を付与
tail(y,10)

#重複あるタプルにTRUE、重複ないタプルにFALSE
duplicated(subset(xx,TRUE,c(Version)))

#真偽の反転
!duplicated(subset(xx,TRUE,c(Version)))

#Version列で重複している一覧取得
#確かに重複している
subset(xx[duplicated(subset(xx,TRUE,c(Version))),],TRUE,c(Version))

#Version列で重複していない一覧取得
#確かに重複していない
subset(xx[!duplicated(subset(xx,TRUE,c(Version))),],TRUE,c(Version))

#Version列で重複している全ての列取得
xx[duplicated(subset(xx,TRUE,c(Version))),]

#Version列で重複していない全ての列取得
xx[!duplicated(subset(xx,TRUE,c(Version))),]


#データフレーム縦結合

#10行X10列の行列
matrix(1, nrow=10, ncol=10)

#10行X10列のデータフレーム
data.frame(matrix(1, nrow=10, ncol=10))

#rbindの場合
M1<-data.frame(matrix(1, nrow=10, ncol=10))
tate<-function(tgt,cnt){
  rt<-NULL
  for(i in 1:cnt){
    rt<-rbind(rt,tgt)
  }
  return(rt)
}
system.time(tate(M1,10000))

#bind_rowsの場合
M1<-data.frame(matrix(1, nrow=10, ncol=10))
tate2<-function(tgt,cnt){
  rt<-NULL
  for(i in 1:cnt){
    rt<-bind_rows(rt,tgt)
  }
  return(rt)
}
system.time(tate2(M1,10000))


#プロキシの設定
Sys.setenv("https_proxy"="http://ホスト名:ポート番号/")
Sys.setenv("http_proxy"="http://ホスト名:ポート番号")
#ワーキングディレクトリの設定
setwd("D:/wrksp")
#Rパッケージのダウンロード元ミラーサイトを東京に設定
options(repos = structure(c(CRAN = "https://cran.ism.ac.jp/")))
#パッケージ管理ツールのインストール
install.packages("pacman")
#pacmanライブラリの読み込み
library("pacman")
#カンマ区切りでインストールするパッケージを指定
pacman::p_load(stringr,dplyr)
