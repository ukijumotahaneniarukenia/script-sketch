#!/usr/bin/perl

$dec=shift;
#NetworkByteOrderとしてバイナリデータ作成
$packed=pack "N", $dec;
#バイナリデータをもとに32bitの文字列を作成
$bin=unpack "B32",$packed;
if($bin eq '00000000000000000000000000000000'){
  $bin=0;
}else{
  $bin=~s/^0+//;
}
print "$bin\n";
