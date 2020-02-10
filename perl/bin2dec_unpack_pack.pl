#!/usr/bin/perl

$bin=shift;
#zero埋めした2進数を作成
$bin32=substr '0' x 32.$bin,-32;
#32桁の2進数と解釈してバイナリデータ作成
$packed=pack "B32", $bin32;
#NetworkByteOrderのビット列として解釈して10進数にunpack.
$dec=unpack "N",$packed;
print "$dec\n";
