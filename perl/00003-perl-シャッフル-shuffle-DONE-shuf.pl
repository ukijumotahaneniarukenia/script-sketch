#!/usr/bin/env perl

use List::Util;

sub usage{
  my $msg=<<"EOS";
Usage:
  LIB:
  CMD: $0 {a..z} or echo {1..4} | $0
  OUT:
       3
       1
       4
       2
EOS
  print $msg,"\n";
  exit 0;
}

sub mock{
  eval {
    print join("\n",map { join(" ", $_) } List::Util::shuffle(@_)),"\n";
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
