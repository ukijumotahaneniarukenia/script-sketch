#!/usr/local/bin/perl

#http://blog.livedoor.jp/dankogai/archives/51838970.html

sub mock{
  print "argc:".$#_,"\n";
  print "argv:".join(",",@_),"\n";
  for(0..$#_){
    my $ele=splice(@_,0,1);
    print "rest:".join(",",@_),"\n";
    print $ele,"\n";
  }
}

#mock(a..c);

sub mock2{
  my @liz=@_;
  for(0..$#_){
    print "rest:".join(",",@liz),"\n";
    my $ele=splice(@_,0,1);
    print $ele,"\n";
  }
}

#mock2(a..c);

sub mock3{
  #第３引数を0以外にすると、置換できる。
  print "-"x80,"\n";
  for(0..$#_){
    print "ind:".$_.",ele:".$_[$_],"\n";
  }
  print "-"x80,"\n";
  #splice(@_,$#_+1,0,"z");
  #my $ele=splice(@_,0,1);
  #splice(@_,$#_+1,0,$ele);
  for(0..$#_){
    my $ele=splice(@_,0,1);
    splice(@_,$#_+1,0,$ele);
    print "ind:".$_.",ele:".$_[$_],"\n";
  }
  #print "-"x80,"\n";
  #splice(@_,1,1,"zz");
  #for(0..$#_){
  #  print "ind:".$_.",ele:".$_[$_],"\n";
  #}
  #print "-"x80,"\n";
  #splice(@_,3,1,"zzz");
  #for(0..$#_){
  #  print "ind:".$_.",ele:".$_[$_],"\n";
  #}
}

#mock3(a..c);


#完成!!
sub mock4{
  for(0..$#_){
    print "ind:".$_.",ele:".$_[$_].",cnt:".scalar(@_).",liz:".join(",",@_),"\n";
    my $ele=splice(@_,0,1);#shift
    splice(@_,$#_+1,0,$ele);#push
  }
}

mock4(a..e);

print "="x80,"\n";

#完成!!
sub mock5{
  for(0..$#_){
    print "ind:".$_.",ele:".$_[$_].",cnt:".scalar(@_).",liz:".join(",",@_),"\n";
    my $ele=splice(@_,-1);#pop
    splice(@_,0,0,$ele);#unshift
  }
}

mock5(a..e);



















