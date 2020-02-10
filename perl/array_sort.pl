#!/usr/local/bin/perl5.30.0

my @arr=(3,2,8,6);

foreach(sort{$a<=>$b}@arr){
  print $_, "\n";
}

foreach(sort{$b<=>$a}@arr){
  print $_, "\n";
}
