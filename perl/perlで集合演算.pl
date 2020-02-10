#!/usr/local/bin/perl

#https://www.toumasu-program.net/entry/2019/03/16/075735

#https://blog.kteru.net/perl-array-sum-differentce-product/

#複数の配列を引数にモテるということが大切

#和集合、どちらかに存在する場合,1
#my @array_a = qw/1 2 3 4 5/;
#my @array_b = qw/3 4 5 6 7/;
#
#my %cnt = ();
#my @array = grep { ++$cnt{$_} == 1 } (@array_a, @array_b);


#print join(",",@array),"\n";
#
#my @array_a = qw/1 2 3 4 5/;
#my @array_b = qw/3 4 5 6 7/;
#
#my %cnt = ();
#my @array = grep { ++$cnt{$_} == 2 } (@array_a, @array_b);
#
#print join(",",@array),"\n";

my @array_a = qw/1 2 3 4 5/;
my @array_b = qw/3 4 5 6 7/;

my %cnt = ();
map { $cnt{$_}-- } @array_b;
my @array = grep { ++$cnt{$_} == 1 } @array_a;

print join(",",@array),"\n";
