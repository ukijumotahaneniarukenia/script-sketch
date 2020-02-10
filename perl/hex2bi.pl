#!/usr/bin/perl

$hex=shift;

@hex_ch=split //,$hex;

$bi='';

#seq 0 15 | xargs -I@ dc -e'10i@p2op16op' | xargs -n 3 | awk '{printf "%s %04d\n" ,$3,$2}' | sed -e's/^/\x27/' -e 's/ /\x27=> \x27/' -e 's/^/,/' -e 's/$/\x27/'

#for($i=0;$i<=$#hex_ch;$i++){
#  print "$hex_ch[$i]\n";
#}

%bi_tbl=(
'0'=> '0000'
,'1'=> '0001'
,'2'=> '0010'
,'3'=> '0011'
,'4'=> '0100'
,'5'=> '0101'
,'6'=> '0110'
,'7'=> '0111'
,'8'=> '1000'
,'9'=> '1001'
,'A'=> '1010'
,'B'=> '1011'
,'C'=> '1100'
,'D'=> '1101'
,'E'=> '1110'
,'F'=> '1111'
);

foreach $each_hex_ch(@hex_ch){
  $each_bi_ch=$bi_tbl{$each_hex_ch};
  $bi.=$each_bi_ch;
}

if($bi eq '0000'){
  $bi='0';
}else{
  $bi=~s/^0+//;
}

print "$bi\n";
