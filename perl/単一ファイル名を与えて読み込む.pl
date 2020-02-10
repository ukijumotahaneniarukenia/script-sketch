#!/usr/local/bin/perl

#http://www.gi.ce.t.kyoto-u.ac.jp/user/susaki/perl/kouji_2000_csv.txt
sub usage{
  my $msg=<<"USAGE";
Usage:
\$./単一ファイル名を与えて読み込む.pl a.csv
a.csv
\$echo a.csv |  ./単一ファイル名を与えて読み込む.pl
a.csv
USAGE
  print $msg,"\n";
  exit 1;
}

sub chk_args{
  if(scalar(@_)!=1){
    #引数個数チェック
    usage();
  }
}

sub handle_args{
  chomp @_;
  $stdin=join(",",@_),"\n";
  $stdin=~s/\n/ /g;
  $stdin=~s/ /,/g;
  @done_args=split(/,/,$stdin);
  return @done_args;
}

sub pre_process{
  my @stdin;
  if(@ARGV){
    #コマンドライン引数の場合
    @stdin = @ARGV;
    @handle_done_args=handle_args(@stdin);
    chk_args(@handle_done_args);
  }elsif(-p STDIN){
    #パイプ経由の場合
    @stdin = <STDIN>;
    @handle_done_args=handle_args(@stdin);
    chk_args(@handle_done_args);
  }else{
    usage();
  }
  return @handle_done_args;
}

sub post_process{
  #print "perl楽しい","\n";
}

sub main_process{
  eval{
    $file=shift @_;
    open(IN,$file) or die "$!";
    while(<IN>){
      chomp($_);
      print $_,"\n";

    }
    close(IN);
  };
  if($@){
    print "Error:".$@,"\n";
  }
}

sub main{
  my @pre_done_args=pre_process();
  main_process(@pre_done_args);
  post_process();
}

main();
