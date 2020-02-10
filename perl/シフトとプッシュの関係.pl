#!/usr/local/bin/perl

#$./シフトとプッシュの関係.pl
#1,2,3,4
#2,3,4,1
#3,4,1,2
#4,1,2,3

my $array=[1..4];
my ($first,@remain)=@{$array};
print join(",",@{$array}),"\n";

for(@remain){
  push @remain,$first;
  print join(",",@remain),"\n";
  $first=shift @remain;
}
