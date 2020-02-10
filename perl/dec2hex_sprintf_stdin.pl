#!/usr/bin/perl

binmode STDIN, ':encoding(utf8)';
#配列にしてうけとる標準入力からの引数が単一でない場合は。
$input=<STDIN>;
chomp($input);

#$hex=sprintf '%x' ,$input;
#print "$hex\n";
