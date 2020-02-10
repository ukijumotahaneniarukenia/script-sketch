#!/bin/bash

printf "%s\n" {4,4}  | xargs -n2 perl -E '
use List::Util qw(reduce);
sub perm{
  my $n=shift @_;
  my $r=shift @_;
  if ($n<$r){
    die "💩";
  } 
  if ($n<=0 or $r<=0){
    die "💩"x2;
  } 
  my $divided=reduce{$a*$b} (1..$n);
  my $divisor=reduce{$a*$b} (1..$n-$r);
  if ($divisor==0){
    $divisor=1;
  } 
  print $divided/$divisor,"\n";
}
perm(shift @ARGV,shift @ARGV);
'
