#!/usr/local/bin/perl

my $array=[1..4];
my $last=pop @{$array};
my @remain=@{$array};
print join(",",@remain),"\n";
print "="x40,"\n";
for(@remain){
  unshift @remain,$last;
  print join(",",@remain),"\n";
  $last=pop @remain;
}
print join(",",($last,@remain)),"\n";
