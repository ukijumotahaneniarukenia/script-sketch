#!/bin/bash

perl -e '
use Math::Combinatorics;
my @array=qw(1 2 3);
print join("\n", map { join " ", @$_ } combine(2,@array)),"\n";
'
