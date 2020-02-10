#!/usr/local/bin/perl5.30.0

use Math::Combinatorics;
my @array=qw(a b c);
#print join("\n", map { join " ", @$_ } combine(2,@array)),"\n";
#print combine(2,@array),"\n";
#print map{join(" ",@$_)} combine(2,@array),"\n";
print join("\n", map { join " ", @$_ } combine(2,@array)),"\n";
