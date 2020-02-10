#!/usr/local/bin/perl

#https://perldoc.jp/func/map
print join("\n",map{ $_*$_ } (1..10)),"\n";

#print join("\n",map{ $_>3 ? ($_*$_) : () } (1..10)),"\n";
#
#print join("\n",map{$_*$_} grep {$_>5} (1..10)),"\n";
