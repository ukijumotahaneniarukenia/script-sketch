#!/usr/local/bin/perl

use List::Util;

my @data = (a..z);
print join(",",@data),"\n";
print join(",",List::Util::shuffle @data),"\n";
