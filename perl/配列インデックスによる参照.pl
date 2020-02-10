#!/usr/local/bin/perl

sub mock{
  print "argc:".$#_,"\n";
  print "argv:".join(",",@_),"\n";
  for(0..$#_){
  #引数個数とると、引数個数-1だから、0始まりで調節しないと
    print "index:".$_.",ele:".$_[$_],"\n";
  }
  #argc:2
  #argv:a,b,c
  #index:0,ele:a
  #index:1,ele:b
  #index:2,ele:c
}

mock(a..c);
