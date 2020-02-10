#!/usr/bin/perl

$dec=shift;

@hex_table=('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
$hex=$hex_table[$dec];
print "0x$hex\n";
