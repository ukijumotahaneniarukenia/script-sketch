#!/usr/local/bin/awk

function print_set(s,   e){
  #配列要素を参照する順序を指定できるようになった。
  PROCINFO["stored_in"]="@ind_str_asc"
  for(e in s){
    printf e " ";
  }
  print "";
}
