#!/usr/bin/env perl

my @arr=(3,2,8,6);

foreach(sort{$a<=>$b}@arr){
  print $_, "\n";
}

foreach(sort{$b<=>$a}@arr){
  print $_, "\n";
}
