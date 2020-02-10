#!/usr/bin/perl

$dec=shift;

$tei=16;
$kotae="\n";
$jou=0;

while($dec>=$tei){
  $amari=$dec%$tei;
  $dec=($dec - $amari)/$tei;
  $kotae="$amari"."x$tei^$jou" .$kotae;
  ++$jou;
  $kotae="+".$kotae;
}

$kotae="$dec"."x$tei^$jou" .$kotae;

print "$kotae";
