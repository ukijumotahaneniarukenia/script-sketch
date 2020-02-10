#!/usr/bin/perl

$dec=shift;

$kotae="\n";
$jou=0;

while($dec>=10){
  $amari=$dec%10;
  $dec=($dec - $amari)/10;
  $kotae="$amari"."x10^$jou" .$kotae;
  ++$jou;
  $kotae="+".$kotae;
}

$kotae="$dec"."x10^$jou" .$kotae;

print "$kotae";
