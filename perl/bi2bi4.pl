#!/usr/bin/perl

$bi=shift;

$bi_amari=(length $bi)%4;

if($bi_amari){
  #0でない場合
  #繰り返し演算子
  $add_zero='0'x(4-$bi_amari);
}else{
  #0である場合
  #awkの真偽と似てる
  $add_zero='';
}

print "$add_zero$bi\n";
