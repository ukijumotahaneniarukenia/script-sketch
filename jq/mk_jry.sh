#!/bin/bash

usage(){
  cat <<EOF
Usage:
  ./mk_jry row sep col
  row:row number
  sep:separator
  col:col_number

Caution:
  mod divided row by col must be zero. 

Example:
  $./mk_jry.sh 30 , 5
  [1,2,3,4,5]
  [6,7,8,9,10]
  [11,12,13,14,15]
  [16,17,18,19,20]
  [21,22,23,24,25]
  [26,27,28,29,30]

EOF
}

def_chk_info(){
  chk_args_cnt=3
}

set_args(){
  #引数配列化
  args=("$@")
  #引数個数カウント
  cnt=${#args[@]}
  row="$1";shift;
  sep="$1";shift;
  col="$1";shift;
}

cnf_args(){
  echo args=$args
  echo cnt=$cnt
  echo row=$row
  echo sep=$sep
  echo col=$col
}

chk_args(){
  #個数チェック
  [ $cnt -ne $chk_args_cnt ] && usage && exit 1
  #空文字チェック
  [ -z "$row" ] && usage && exit 1
  #数値チェック
  expr 1 + "$row" 2>/dev/null 1>/dev/null
  if [ $? -lt 2 ];then
    :
  else
    usage && exit 1
  fi
  #空文字チェック
  [ -z "$sep" ] && usage && exit 1
  #文字チェック
  expr 1 + "$seq" 2>/dev/null 1>/dev/null
  if [ $? -lt 2 ];then
    usage && exit 1
  else
    :
  fi
  #空文字チェック
  [ -z "$col" ] && usage && exit 1
  #数値チェック
  expr 1 + "$col" 2>/dev/null 1>/dev/null
  if [ $? -lt 2 ];then
    :
  else
    usage && exit 1
  fi
  [ $(($row%$col)) -ne 0 ] && usage && exit 1
}

def_dyn_cmd(){
  main_cmd="printf"
  fmt_head_mark="["
  fmt_main_mark="%s"
  fmt_tail_mark="]"
  lf="\\\xa"
  gen_num="\$(seq $row | xargs -n$row)"
}

cnf_fmt_cmd(){
  echo -e "seq $row | xargs -I@ echo "%s" | xargs | tr ' ' '$sep'"
}

set_fmt_cmd(){
  fmt=$(echo -e "seq $col | xargs -I@ echo "$fmt_main_mark" | xargs | tr ' ' '$sep'"|bash)
}

cnf_dyn_cmd(){
  echo -e "printf \x22$fmt_head_mark$fmt$fmt_tail_mark$lf\x22 $gen_num" 
}

set_dyn_cmd(){
  dyn_cmd=$(echo -e "printf \x22$fmt_head_mark$fmt$fmt_tail_mark$lf\x22 $gen_num")
}

build_dyn_cmd(){
  :
}

exec_dyn_cmd(){
  echo $dyn_cmd | bash
}

main(){
  def_chk_info
  set_args $(cat -)
  cnf_args
  chk_args
  def_dyn_cmd
  #cnf_fmt_cmd
  set_fmt_cmd
  #cnf_dyn_cmd
  set_dyn_cmd
  build_dyn_cmd
  exec_dyn_cmd
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
