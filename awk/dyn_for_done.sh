#!/bin/bash

#入力データ
#grp_col1 val
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

#cat "$@" | wc -l | xargs -I@ bash -c 'yes @ | head -n@' | paste - "$@" | nl | \

#LN_NO,MX_LN_NO,GRP_COL1,VAL
#     1	11	0 1
#     2	11	0 1
#     3	11	0 2
#     4	11	0 2
#     5	11	0 2
#     6	11	0 3
#     7	11	1 1
#     8	11	1 2
#     9	11	1 2
#    10	11	1 3
#    11	11	1 3

#awk '{
#  MX_ROW_CNT=$2
#  MX_COL_CNT=NF
#  #グループ列ごとの要素数を取得するため、配列に落とし込んでいる。インデックスに紐づく値はデフぉで1にしているけど、なんでもいい
#  DEFALUT_VAL=1
#  #セパレーた
#  SEP="\t"
#  GRP_COL1[$3]=DEFALUT_VAL
#  GRP_SET[$3,$4]=$4
#  #データフレームを一行一アイテムごとにDAT配列に落とし込む
#  #行:NR(現在の行番号),列:1..NF
#  #NFには列の最大数を保持している。デクリメントしたほうが第一列から順になめ回しやすい
#  #カッコでコマンド置換した結果に$足して列参照
#  #for(col=MX_COL_CNT;col>0;col--){
#  # DAT[NR,col]=$(NF-(col-1))
#  #}
#  #NFには列の最大数を保持している。インクリメントしたほうが最終列から順になめ回しやすい
#  #カッコでコマンド置換した結果に$足して列参照
#  for(col=1;col<=MX_COL_CNT;col++){
#    DAT[NR,col]=$((NF+1)-col)
#  }
#}END{
#  #GRP_COLごとにrow_numberを付番するため、グループ列ごとの要素数を取得
#  for(ele in GRP_COL1){cnt++;}GRP_COL1_CNT=cnt;
#  #横持ちデータを縦持ちデータに変換←この変換は不要
#  #for(row=1;row<=MX_ROW_CNT;row++){
#  #  for(col=1;col<=MX_COL_CNT;col++){
#  #    print row,col,DAT[row,col]
#  #  }
#  #}
#  #縦持ちデータを横持ちデータに変換
#  agg[MX_ROW_CNT]="";
#  for(row=1;row<=MX_ROW_CNT;row++){
#    for(col=1;col<=MX_COL_CNT;col++){
#      agg[row]=agg[row]""SEP""DAT[row,col]
#    }
#  }
#  #ENDパタンはサマリ行しかデフォルトの使い方では出力されないため、配列に落とし込んでから、行単位に出力している。
#  for(row=1;row<=MX_ROW_CNT;row++){
#    print agg[row]
#  }
#}
#'
#標準入力で読み込んだ時の状態
#LN_NO,MX_LN_NO,GRP_COL1,VAL
#     1	11	0 1
#     2	11	0 1
#     3	11	0 2
#     4	11	0 2
#     5	11	0 2
#     6	11	0 3
#     7	11	1 1
#     8	11	1 2
#     9	11	1 2
#    10	11	1 3
#    11	11	1 3

#awkでの処理結果を標準出力に吐いた状態
#	1	0	11	1
#	1	0	11	2
#	2	0	11	3
#	2	0	11	4
#	2	0	11	5
#	3	0	11	6
#	1	1	11	7
#	2	1	11	8
#	2	1	11	9
#	3	1	11	10
#	3	1	11	11

#垂直展開した状態
#     1	1 1 1
#     2	1 2 0
#     3	1 3 11
#     4	1 4 1
#     5	2 1 1
#     6	2 2 0
#     7	2 3 11
#     8	2 4 2
#     9	3 1 2
#    10	3 2 0
#    11	3 3 11
#    12	3 4 3
#    13	4 1 2
#    14	4 2 0
#    15	4 3 11
#    16	4 4 4
#    17	5 1 2
#    18	5 2 0
#    19	5 3 11
#    20	5 4 5
#    21	6 1 3
#    22	6 2 0
#    23	6 3 11
#    24	6 4 6
#    25	7 1 1
#    26	7 2 1
#    27	7 3 11
#    28	7 4 7
#    29	8 1 2
#    30	8 2 1
#    31	8 3 11
#    32	8 4 8
#    33	9 1 2
#    34	9 2 1
#    35	9 3 11
#    36	9 4 9
#    37	10 1 3
#    38	10 2 1
#    39	10 3 11
#    40	10 4 10
#    41	11 1 3
#    42	11 2 1
#    43	11 3 11
#    44	11 4 11



#cutコマンドは集約列ごとに要素数取得
cat "$@" | wc -l | xargs -I@ bash -c 'yes @ | head -n@ | paste - <(yes GRP_COL1_UNIQ_CNT | head -n@)' | paste - "$@" | sed "s;GRP_COL1_UNIQ_CNT;$(cat "$@" | cut -d ' ' -f1 | sort -u | wc -l);" | \
  awk '{
print
}
'
#row_number(){
#  divided=$1;shift;
#  divisor=$1;shift;
#  while read rn cmd;do
#    mod=$(eval echo $cmd);
#    [ $mod -eq 0 ]&&mod=$divisor;
#    grp=0;
#    [ $mod -eq 1 ]&&grp=$((grp+1));
#    echo $rn $mod $grp;
#  done < <(seq $divided | xargs -I@ bash -c 'echo @ "$\(\(@%\$divisor\)\)"')|awk 'BEGIN{sum=0}{sum+=$3;print sum,$2}'
#}
#row_number 10 3
