#!/usr/local/bin/perl

use Math::Combinatorics;
my @array=qw(a b c);
print join("\n",map { join " ", @$_ } permute(@array)),"\n";

#a b c
#a c b
#b a c
#b c a
#c a b
#c b a
