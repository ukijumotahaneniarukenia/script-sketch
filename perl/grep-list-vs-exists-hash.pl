#!/usr/local/bin/perl

ベンチ取り方
https://tutorial.perlzemi.com/blog/20100509127696.html

#https://gihyo.jp/dev/serial/01/perl-hackers-hub/005503
#https://www.nishishi.com/perltips/script1.html
#http://surigoma.hateblo.jp/entry/2014/01/27/232245

require "array_dat.pm";

#print $array,"\n";
#print @{$array},"\n";
#
#print join(",",@{$array}),"\n";
#
#$inc_array=$array;
#
#print $inc_array,"\n";
#print @{$inc_array},"\n";
#print join(",",@{$inc_array}),"\n";

sub usegrep {
    my $search_cond = '^Y$';
    #return 1 if grep { $search_cond eq $_ } @{$inc_array};
    print join(",",@{$inc_array}),"\n";
    #
    print grep{$search_cond eq $_} @{$inc_array};
    print grep{$search_cond eq $_} @{$inc_array};
    #my @matched=grep{$search_cond eq $_} @{$inc_array};
    #print @matched,"\n";
    #return 1 if grep { $search_cond eq $_ } @{$inc_array};
}

sub test2_grep{
  #my $search_cond = '^Y$';
  my $inc_array=$array;
  print @{$inc_array},"\n";
  print [@{$inc_array}],"\n";
  print join(",",@{$inc_array}),"\n";
  my @match=grep{$_ =~ /J*/} @{$inc_array};
  print @match,"\n";
  print [@match],"\n";
  print join(",",@match),"\n";
}

sub test_grep{
  my @nums = (1, 2, 3, 4);
  my @self = grep { $_ eq 2 } @nums;
  #my @even = grep { $_ % 2 == 0 } @nums;
  print @self,"\n";
  #print map { $_} @nums,"\n";
  #print join(",",map { $_} @nums),"\n";
}

sub main{
  #test_grep();
  test2_grep();
  #usegrep();
  #my $result=usegrep();
  #print $result,"\n";
}

main();
