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
    my @done=grep{++$cnt{$_}==2}(@self, @other);#各配列のインデックスキー(ユニーク値)に対応する値が1（perlは数値のデフォルト値が1）の場合（存在する場合は）はインクリメントし、その結果が2と等しい場合、done配列に格納する。重複していないと、1のままなので、取得結果に含まれない。
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
