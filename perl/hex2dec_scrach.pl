#!/usr/bin/perl

$hex=shift;

@hex_ch=split //,$hex;
$jou=@hex_ch-1;
$dec=0;

for($i=0;$i<=$#hex_ch;$i++){
  print "$hex_ch[$i]\n";
}

%hex_tbl=(
'1'=> 1
,'2'=> 2
,'3'=> 3
,'4'=> 4
,'5'=> 5
,'6'=> 6
,'7'=> 7
,'8'=> 8
,'9'=> 9
,'A'=> 10
,'B'=> 11
,'C'=> 12
,'D'=> 13
,'E'=> 14
,'F'=> 15
);
