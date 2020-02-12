#!/usr/bin/env perl

use Math::Combinatorics;

sub usage{
  my $msg=<<"EOS";
Usage:
  LIB: apt install -y cpanminus && cpanm Math::Combinatorics
  CMD: $0 2 {1..4} or echo 2 {1..4} | $0
  OUT:
EOS
  print $msg,"\n";
  exit 0;
}

sub mock{
  eval {
    print join("\n",map { join(" ", @$_) } combine(shift(@_), @_)),"\n"; #combine関数の戻り値がリファで返却されてくるので、デリファする
  };

  if($@){
    print "ERROR:$@"; # 例外内容を表示
    exit 1;
  }
  return 0;
}

sub main{
  my $rt=0;
  if ( @ARGV ) {
      $rt=mock @ARGV;
  } elsif ( -p STDIN ) {
      @stdin=map { $_ =~ s/\n$//;$_;} split(/ /,<STDIN>); #スペース区切りの単一スカラ値で入ってくるぽいので、splitで配列に展開し、最終要素の末尾に改行文字が含まれているので、sコマンドで置換
      $rt=mock @stdin;
  } else {
      usage;
  }
  exit $rt;
}

main
