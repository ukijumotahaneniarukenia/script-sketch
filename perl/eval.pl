#!/usr/bin/perl

#[oracle@centos perl]$ perl eval.pl 3+4
#[oracle@centos perl]$ perl eval.pl 3**5
#[oracle@centos perl]$ perl eval.pl length\('unko'\)
#[oracle@centos perl]$ perl eval.pl substr\('unko',1,2\)

$input=shift;
$output=eval $input;
print "$output\n";
