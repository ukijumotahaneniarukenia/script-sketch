#!/usr/local/bin/perl

use Term::ANSIColor qw( :constants ); $Term::ANSIColor::AUTORESET = 1;
use Data::Dumper;

my @array = (a..e);
my %hash = (a..e);

print BRIGHT_WHITE "-"x80,"\n";
while(my($ind,$val)=each(@array)){
  print BRIGHT_GREEN $ind.":".$val,"\n";
}
print BRIGHT_YELLOW Dumper \@array;

print BRIGHT_WHITE "-"x80,"\n";
while(my($key,$val)=each(%hash)){
  print BRIGHT_GREEN $key.":".$val,"\n";
}
print BRIGHT_YELLOW Dumper \%hash;

#配列よりkey=>1のハッシュデータを作成
my %hash2 = map{$_=>1} @array;

print BRIGHT_WHITE "-"x80,"\n";
while(my($key,$val)=each(%hash2)){
  print BRIGHT_GREEN $key.":".$val,"\n";
}
print BRIGHT_YELLOW Dumper \%hash2;
