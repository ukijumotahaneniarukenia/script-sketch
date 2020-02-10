#!/bin/bash

#echo -e  "'1000',a,c,b\nu,n,ko" | perl -lpe '
#  @array=split(/,(?=(?:[^\x27]*\x27[^\x27]*\x27)*[^\x27]*$)/,$_);
#  print $..":".@array;
#  '

#  echo -e  "'1000',a,c,b\nu,n,ko" | perl -lpe '
#  @array=split(/,(?=(?:[^\x27]*\x27[^\x27]*\x27)*[^\x27]*$)/,$_);
#  while(my($ind,$val)=each(@array)){
#    print "rn:".$..",[".$ind."]".$val;
#  }
#  '

# シングルクォートで挟まれた文字列が右側にあるカンマ
# https://rubular.com/
  echo -e  "'1000',a,c,b\nu,n,ko" | perl -lpe '
  @array=split(/,(?=(?:[^\x27]*\x27[^\x27]*\x27)*[^\x27]*$)/,$_);
  while(my($ind,$val)=each(@array)){
    print "rn:".$..",[".$ind."]".$val;
  }
  '
