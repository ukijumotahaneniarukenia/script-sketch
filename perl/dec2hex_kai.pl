#!/usr/bin/perl

$dec=shift;

$tei=16;
$kotae="\n";
$jou=0;

@hex_table=('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');

while($dec>=$tei){
  $amari=$dec%$tei;
  $dec=($dec - $amari)/$tei;
  $kotae=$hex_table[$amari].$kotae;
  ++$jou;
}

$kotae="0x".$hex_table[$dec].$kotae;

print "$kotae";
