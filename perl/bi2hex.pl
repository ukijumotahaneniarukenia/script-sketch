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

#seq 0 15 | xargs -I@ dc -e'10i@p2op16op' | xargs -n 3 | awk '{printf "%04d %s\n" ,$2,$3}' | sed -e's/^/\x27/' -e 's/ /\x27=> \x27/' -e 's/^/,/' -e 's/$/\x27/'

%hex_tbl=(
'0000'=> '0'
,'0001'=> '1'
,'0010'=> '2'
,'0011'=> '3'
,'0100'=> '4'
,'0101'=> '5'
,'0110'=> '6'
,'0111'=> '7'
,'1000'=> '8'
,'1001'=> '9'
,'1010'=> 'A'
,'1011'=> 'B'
,'1100'=> 'C'
,'1101'=> 'D'
,'1110'=> 'E'
,'1111'=> 'F'
);

$offset=0;
$hex='';
$bi=$add_zero.$bi;

while($nibble=substr $bi,$offset,4){
  #0でないし、空文字でなければ標準出力に出力
  #print "$nibble\n";
  $hex.=$hex_tbl{$nibble};
  $offset+=4;
}

print "$hex\n";
