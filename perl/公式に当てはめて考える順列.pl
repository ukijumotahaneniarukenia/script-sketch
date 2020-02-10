#!/usr/local/bin/perl

#http://www.sist.ac.jp/~kanakubo/research/hosoku/junretukumiawase.html
#https://fkmn.exblog.jp/6715955/https://fkmn.exblog.jp/6715955/
#https://perlmaven.com/factorial-in-perl
#
use List::Util qw(reduce);
my $fact = reduce { $a * $b } 1 .. $n;


sub perm{
  #print join(",",@_),"\n";
  my $n=shift @_;
  my $r=shift @_;
  #print $n,"\n";
  #print $r,"\n";
  #print join(",",(1..$n)),"\n";
  #print map{$_} (1..$n),"\n";
  #print join(",",(1..$r)),"\n";
  #print join(",",(1..$n-$r)),"\n";
  #print map{$_*$_} (1..$n),"\n";
  #print map{$_*$_} (1..$n-$r),"\n";
  #@divided=map{$_*$_} (1..$n);
  #@divisor=map{$_*$_} (1..$n-$r);
  #print join(",",map{$_} (@divided,@divisor)),"\n";
  my $divided=reduce{$a*$b} (1..$n);
  my $divisor=reduce{$a*$b} (1..$r);
  #print $divided,"\n";
  #print $divisor,"\n";
  print $divided/$divisor,"\n";
}


perm(4,2);

#print  "unko","\n";
