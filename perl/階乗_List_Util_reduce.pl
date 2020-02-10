#!/usr/local/bin/perl

#https://perlmaven.com/factorial-in-perl
$n=5;
use List::Util qw(reduce);
my $fact = reduce { $a * $b } 1 .. $n;
print $fact,"\n";
