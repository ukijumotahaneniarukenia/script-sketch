#!/bin/bash

printf "%s\n" {4,2} | xargs -n2 perl -E '
use List::Util qw(reduce);
sub comb{
  my $n=shift @_;
  my $r=shift @_;
  if ($n<$r){
    die "💩";
  } 
  if ($n<=0 or $r<=0){
    die "💩"x2;
  } 
  my $divided=reduce{$a*$b} (1..$n);
  my $divisor1=reduce{$a*$b} (1..$n-$r);
  my $divisor2=reduce{$a*$b} (1..$r);
  if ($divisor1==0){
    $divisor1=1;
  } 
  print $divided/($divisor1*$divisor2),"\n";
}
comb(shift @ARGV,shift @ARGV);
'
