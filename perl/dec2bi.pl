#!/usr/bin/perl

$dec=shift;

$tei=2;
$kotae="b\n";
$jou=0;

while($dec>=$tei){
  $amari=$dec%$tei;
  $dec=($dec - $amari)/$tei;
  $kotae=$amari.$kotae;
  ++$jou;
}

$kotae=$dec.$kotae;

print "$kotae";
