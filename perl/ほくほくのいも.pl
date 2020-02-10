#!/usr/local/bin/perl

use strict;
use warnings;
use utf8;#日本語表示に必要
use List::Util qw/shuffle/;  

binmode STDOUT, ':encoding(utf-8)';
my @hokuimo = split('', 'ホクイモ');
my $hoku = join('', (shuffle(@hokuimo))[0..1]);
my $imo = join('', (shuffle(@hokuimo))[0..1]);
print "${hoku}${hoku}の${imo}","\n";
