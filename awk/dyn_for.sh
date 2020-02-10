#!/bin/bash

#awkに渡すデータ
#MX_LN_NO,GRP_COL1_UNIQ_CNT,GRP_COL1,VAL
#11	2	0 1
#11	2	0 1
#11	2	0 2
#11	2	0 2
#11	2	0 2
#11	2	0 3
#11	2	1 1
#11	2	1 2
#11	2	1 2
#11	2	1 3
#11	2	1 3

#cutコマンドは集約列ごとに要素数取得
cat "$@" | wc -l | xargs -I@ bash -c 'yes @ | head -n@ | paste - <(yes GRP_COL1_UNIQ_CNT | head -n@)' | paste -d ' ' - "$@" | sed "s;GRP_COL1_UNIQ_CNT;$(cat "$@" | cut -d ' ' -f1 | sort -u | wc -l);" | \
sed 's;\t; ;' | \
#グルーピンぐ列ごとにシーケンス番号を付与
#MX_LN_NO,GRP_COL1_UNIQ_CNT,GRP_COL1,VAL,GRP,GRP_SEQ,SEQ
#11 2 0 1 1 1 1
#11 2 0 1 1 2 2
#11 2 0 2 1 3 3
#11 2 0 2 1 4 4
#11 2 0 2 1 5 5
#11 2 0 3 1 6 6
#11 2 1 1 2 1 7
#11 2 1 2 2 2 8
#11 2 1 2 2 3 9
#11 2 1 3 2 4 10
#11 2 1 3 2 5 11
cat - | awk '
BEGIN{
  GRP=1
  PRE_GRP=1
}
{
  GRP_COL_CAT=$3
  if(PRE_GRP_COL_CAT!=GRP_COL_CAT){
    GRP_SEQ=1
    GRP=GRP+1
  }else{
    GRP_SEQ=GRP_SEQ+1
    PRE_GRP=GRP
  }
  PRE_GRP_COL_CAT=GRP_COL_CAT
  PRE_GRP=GRP
  print $0,GRP,GRP_SEQ,NR
}
' | \
cat - | \
#グルーピンぐ列ごとの最大シーケンス番号のうち、グルーピンぐ同士の中で、最大値を各明細行ごとに取得
#SEQ,GRP_SEQ,GRP,VAL,GRP_COL1,GRP_COL1_UNIQ_CNT,MX_LN_NO,GRP_MX_SEQ
#	1	1	1	1	0	2	11	6
#	2	2	1	1	0	2	11	6
#	3	3	1	2	0	2	11	6
#	4	4	1	2	0	2	11	6
#	5	5	1	2	0	2	11	6
#	6	6	1	3	0	2	11	6
#	7	1	2	1	1	2	11	6
#	8	2	2	2	1	2	11	6
#	9	3	2	2	1	2	11	6
#	10	4	2	3	1	2	11	6
#	11	5	2	3	1	2	11	6
cat - | awk '
function size_set(self,   ele,cnt){
  #引数に受け取った集合を舐め回して、インデックスに紐づく値が1である個数を返却
  for(ele in self){
    if(self[ele]==1){
        cnt++;
    }
  }
  return cnt;
}
BEGIN{
  SEP="\t"
}
{
  MX_ROW_CNT=$1
  MX_COL_CNT=NF
  #データフレームを一行一アイテムごとにDAT配列に落とし込む
  #行:NR(現在の行番号),列:1..NF
  #NFには列の最大数を保持している。デクリメントしたほうが第一列から順になめ回しやすい
  #カッコでコマンド置換した結果に$足して列参照
  for(col=MX_COL_CNT;col>0;col--){
   DAT[NR,col]=$(NF-(col-1))
  }
  #GRP_SEQをインデックスにしておく
  GRP_SET_ELE[$6]=1
}
END{
  #縦持ちデータを横持ちデータに変換
  agg[MX_ROW_CNT]="";
  for(row=1;row<=MX_ROW_CNT;row++){
    for(col=1;col<=MX_COL_CNT;col++){
      agg[row]=agg[row]""SEP""DAT[row,col]
    }
  }
  #ENDパタンはサマリ行しかデフォルトの使い方では出力されないため、配列に落とし込んでから、行単位に出力している。
  for(row=1;row<=MX_ROW_CNT;row++){
    print agg[row]""SEP""size_set(GRP_SET_ELE)
  }
}
' | \
cat - | awk '
BEGIN{
  SEP=","
}
{
  GRP_COL1_MX_CNT=$8
  GRP_COL1_UNIQ_CNT=$6
  #GRP,GRP_SEQをインデックスにしておく
  #バリューはVAL
  GRP_SET[$3,$2]=$4
}
END{
  for(row=1;row<=GRP_COL1_UNIQ_CNT;row++){
    for(col=1;col<=GRP_COL1_MX_CNT;col++){
      agg[row]=agg[row]""SEP""GRP_SET[row,col]
    }
  }
  #ENDパタンはサマリ行しかデフォルトの使い方では出力されないため、配列に落とし込んでから、行単位に出力している。
  for(row=1;row<=GRP_COL1_UNIQ_CNT;row++){
    print row,agg[row]
  }
}
'

#Usage

#たぶん方針かえるとおもう

#グループ列の値が2の場合、
#[sqlite💛ceacf3fb0808 (金 10月 25 22:33:31) ~/script_scratch/awk]$./dyn_for.sh data 
#1 ,1,1,2,2,2,3
#2 ,1,2,2,3,3,
#[sqlite💛ceacf3fb0808 (金 10月 25 22:33:32) ~/script_scratch/awk]$cat data
#0 1
#0 1
#0 2
#0 2
#0 2
#0 3
#1 1
#1 2
#1 2
#1 3
#1 3
