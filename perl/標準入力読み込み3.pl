#!/usr/local/bin/perl
#https://qiita.com/xtetsuji/items/d9800864c23af47c1443

sub usage{
  my $msg=<<"USAGE";
Usage:
\$./標準入力読み込み3.pl "\$(echo {a..f} | xargs -n3)"
コマンドライン引数
a
b,c,d,e,f
\$./標準入力読み込み3.pl \$(echo {a..f} | xargs -n3)
コマンドライン引数
a
b,c,d,e,f
\$echo {a..f} | xargs -n3 | ./標準入力読み込み3.pl
パイプ経由
a
b,c,d,e,f
\$cat src
a b c
d e f
\$cat src | ./標準入力読み込み3.pl
パイプ経由
a
b,c,d,e,f
\$./標準入力読み込み3.pl \$(cat src)
コマンドライン引数
a
b,c,d,e,f
\$./標準入力読み込み3.pl "\$(cat src)"
コマンドライン引数
a
b,c,d,e,f
USAGE
  print $msg,"\n";
}

sub handle_args{
  my @stdin;
  my @init_args;

  if ( @ARGV ) {
      # 引数が指定されていればそちらを採用
      @stdin = @ARGV;
      chomp @stdin;
      $stdin=join(",",@stdin),"\n";
      $stdin=~s/\n/ /g;
      $stdin=~s/ /,/g;
      @init_args=split(/,/,$stdin);
      print "コマンドライン引数","\n";
  } elsif ( -p STDIN ) {
      # 引数が指定されておらず、標準入力からデータが流されている場合はそちらを採用
      @stdin = <STDIN>;
      chomp @stdin;
      $stdin=join(",",@stdin),"\n";
      $stdin=~s/ /,/g;
      @init_args=split(/,/,$stdin);
      print "パイプ経由","\n";
  } else {
      usage;
  }
  return @init_args;
}

sub main{
  my ($first,@remain)=handle_args;
  print join(",",$first),"\n";
  print join(",",@remain),"\n";
}

main
