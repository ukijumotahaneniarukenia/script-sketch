#!/bin/bash

usage(){
cat <<EOS
Usage:
  $0 test.csv
EOS
exit 0
}

FILE=$1;shift

[ -z $FILE ] && usage

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

}' "$FILE"
