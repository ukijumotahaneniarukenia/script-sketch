#!/usr/bin/env perl

use Math::Combinatorics;

sub usage{
  my $msg=<<"EOS";
Usage:
  LIB: apt install -y cpanminus && cpanm Math::Combinatorics
  CMD: $0 {1..4} or echo {1..4} | $0
  OUT:
       2 1 3 4
       2 1 4 3
       2 3 1 4
       2 3 4 1
       2 4 1 3
       2 4 3 1
       1 2 3 4
       1 2 4 3
       1 3 2 4
       1 3 4 2
       1 4 2 3
       1 4 3 2
       3 2 1 4
       3 2 4 1
       3 1 2 4
       3 1 4 2
       3 4 2 1
       3 4 1 2
       4 2 1 3
       4 2 3 1
       4 1 2 3
       4 1 3 2
       4 3 2 1
       4 3 1 2
EOS
  print $msg,"\n";
  exit 0;
}

sub mock{
  print "argc:".scalar(@_),"\n";
  print "argv:".join(",",@_),"\n";
  eval {
    print join("\n",map { join(" ", @$_) } permute(@_)),"\n"; #permute関数の戻り値がリファで返却されてくるので、デリファする
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
      print "コマンドライン引数","\n";
      print "型確認:"  .\@ARGV,"\n";
      print "個数確認:"  .scalar(@ARGV),"\n";
      print "中身確認:"  .join (",",@ARGV),"\n";
      $rt=mock @ARGV;
  } elsif ( -p STDIN ) {
      @stdin=map { $_ =~ s/\n$//;$_;} split(/ /,<STDIN>); #スペース区切りの単一スカラ値で入ってくるぽいので、splitで配列に展開し、最終要素の末尾に改行文字が含まれているので、sコマンドで置換
      print "パイプ経由","\n";
      print "型確認:"  .\@stdin,"\n";
      print "個数確認:"  .scalar(@stdin),"\n";
      print "中身確認:"  .join (",",@stdin),"\n";
      $rt=mock @stdin;
  } else {
      usage;
  }
  exit $rt;
}

main
