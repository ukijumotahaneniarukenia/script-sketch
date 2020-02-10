#!/usr/bin/perl

$dec=shift;
#print "$dec\n";
#print "$amari\n";
#print "$dec\n";

$kotae="\n";
$jou=0;


$amari=$dec%10;
$dec=($dec - $amari)/10;
$kotae="$amari"."x10^$jou" .$kotae;
++$jou;
$kotae="+".$kotae;
print "$kotae\n";
print "$dec\n";
$amari=$dec%10;
$dec=($dec - $amari)/10;
$kotae="$amari"."x10^$jou" .$kotae;
++$jou;
$kotae="+".$kotae;
print "$kotae\n";
print "$dec\n";
$amari=$dec%10;
$dec=($dec - $amari)/10;
$kotae="$amari"."x10^$jou" .$kotae;
++$jou;
$kotae="+".$kotae;
print "$kotae\n";
print "$dec\n";
$amari=$dec%10;
$dec=($dec - $amari)/10;
$kotae="$amari"."x10^$jou" .$kotae;
++$jou;
$kotae="+".$kotae;
print "$kotae\n";

print "$dec\n";
