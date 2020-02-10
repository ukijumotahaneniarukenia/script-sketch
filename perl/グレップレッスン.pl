#!/usr/local/bin/perl

require "array_dat.pm";

sub test_grep{
  my $search_cond=shift @_;
  print $search_cond,"\n";
  print "-"x80,"\n";
  my $inc_array=$array;
  print @{$inc_array},"\n";
  print [@{$inc_array}],"\n";
  print join(",",@{$inc_array}),"\n";
  print "="x80,"\n";
  my @match=grep{$_ =~ /$search_cond/} @{$inc_array};
  print @match,"\n";
  print [@match],"\n";
  print join(",",@match),"\n";
}

sub test2_grep{
  my $search_cond=shift @_;
  print $search_cond,"\n";
  #print "-"x80,"\n";
  my $inc_array=$array;
  #print join(",",@{$inc_array}),"\n";
  print scalar(@{$inc_array}),"\n";
  #print scalar($inc_array),"\n";
}

sub main{
  test2_grep(@ARGV);
}

main(@ARGV);
