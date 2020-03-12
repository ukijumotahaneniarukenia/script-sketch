#!/bin/bash

awk -v FS=',' '
BEGIN{
  grp=0
  subgrp=0
}
{
  if(pre_grp!=$1){
    pre_grp=$1
    pre_subgrp=$2
    grp=grp+1
    subgrp=1
    subgrp_seq[$1$2]=subgrp_seq[$1$2]+1
    print grp,$1,subgrp,$2,subgrp_seq[$1$2],$3
  }else if(pre_grp==$1 && pre_subgrp!=$2){
    pre_grp=$1
    pre_subgrp=$2
    subgrp=subgrp+1
    subgrp_seq[$1$2]=subgrp_seq[$1$2]+1
    print grp,$1,subgrp,$2,subgrp_seq[$1$2],$3
  }else{
    subgrp_seq[$1$2]=subgrp_seq[$1$2]+1
    print grp,$1,subgrp,$2,subgrp_seq[$1$2],$3
  }

}' test.csv

#果物 apple ラディッシュ 20200302 4
#果物 apple 藤 20200304 6
#果物 apple キャメオ 20200304 8
#果物 banana フィリピンバナナ 20190202 7
#果物 banana オランダばなな 20190202 11
#洋服 ニット 春ニット 20200302 4
#洋服 ニット 夏ニット 20200525 2
#洋服 パンツ デニム 20201025 3
#洋服 パンツ スカート 20200525 1
