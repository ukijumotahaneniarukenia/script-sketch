#!/usr/bin/perl

$bin=shift;

@bin_ch=split //,$bin;
$jou=@bin_ch-1;
$dec=0;

#for($i=0;$i<=$#bin_ch;$i++){
#  print "$bin_ch[$i]\n";
#}

foreach $each_bin_ch(@bin_ch){
  $dec+=$each_bin_ch*(2**$jou);
  --$jou;
}

print "$dec\n";
