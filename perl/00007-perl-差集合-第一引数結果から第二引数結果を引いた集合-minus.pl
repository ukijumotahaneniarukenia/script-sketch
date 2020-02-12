#!/usr/bin/env perl

sub usage{
  my $msg=<<"EOS";
Usage:
  LIB:
  CMD: $0 'ls \$HOME/script-sketch/perl' 'ls \$HOME/script-sketch/awk'
  OUT:
EOS
  print $msg,"\n";
  exit 0;
}

sub mock{
  my @self=`@_[0]`;#バッククヲートでコマンド実行し、変数格納
  my @other=`@_[1]`;

  eval{
    my %cnt=();
    map {$cnt{$_}--}@other;#数値型のデフォルト値は1なので、@other配列のインデックスキーに紐づく値がある分だけ、デクリメントし0に初期化。
    my @done=grep{++$cnt{$_}==1}@self;#初期化したので、@self配列のインデックスキーに紐づく値がある分だけインクリメントして1と等しくなる場合、取得結果に含める。
    print @done;
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
