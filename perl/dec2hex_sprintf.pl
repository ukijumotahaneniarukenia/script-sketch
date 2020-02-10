#!/usr/bin/perl

#[oracle@centos perl]$ perl dec2hex_sprintf.pl 3000
#bb8
#[oracle@centos perl]$ perl dec2hex_sprintf.pl 30
#1e
#[oracle@centos perl]$ perl dec2hex_sprintf.pl 300
#12c

$dec=shift;
$hex=sprintf '%x' ,$dec;
print "$hex\n";
