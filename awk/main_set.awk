#!/usr/local/bin/awk

@include "conf_set.awk"
@include "ope_set.awk"

NR==1{
  for(i=1;i<=NF;i++){
    self[$i] = 1;
  }
}
NR==2{
  for(i=1;i<=NF;i++){
    other[$i] = 1;
  }
}
END{
  printf "SELF:"; print_set(self);
  printf "OTHER:"; print_set(other);
  #コピー先の集合を初期化
  #split("",tgt," ");
  #printf "NEW_SELF:"; copy_set(tgt,self);print_set(tgt);
  #cnt=common_set(common,self,other);
  printf ("COMMON___%d___:",cnt); print_set(common);
  cnt=union_set(union,self,other);
  printf ("UNION___%d___:",cnt); print_set(union);
  cnt=minus_set(minus,self,other);
  printf ("MINUS_OTHER___%d___:",cnt); print_set(minus);
  cnt=minus_set(minus,other,self);
  printf ("MINUS_SELF___%d___:",cnt); print_set(minus);
  cnt=except_common_union_set(except_common_union,self,other);
  printf ("EXCEPT_COMMON_UNION___%d___:",cnt); print_set(except_common_union);
}
