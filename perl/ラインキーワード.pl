#!/usr/local/bin/perl

#シェル芸に投下する際はリファラからのデリファで@問題を回避する。
#通知が行かないように工夫。

my $array=[1..4];

print $array,"\n";
print @{$array},"\n";

foreach my $val(@{$array}){
  print $val." at LINE:".__LINE__,"\n";
}

while(my($ind,$val)=each(@{$array})){
  print $ind.":".$val." at LINE:".__LINE__,"\n";
}
