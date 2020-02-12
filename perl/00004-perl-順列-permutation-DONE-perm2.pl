#!/usr/bin/env perl

sub usage{
  my $msg=<<"EOS";
Usage:
  LIB:
  CMD: $0 2 {1..4} or echo 2 {a..d} | $0
  OUT:
       a b
       a c
       a d
       b a
       b c
       b d
       c a
       c b
       c d
       d a
       d b
       d c

EOS
  print $msg,"\n";
  exit 0;
}

#https://memo.sugyan.com/entry/20090329/1238305558
# 渡された配列から $m 個を選ぶ順列を返すサブルーチン
sub permutation {
    my $m = shift;
    return ([]) if ($m == 0);

    my @results = ();
    for (0..$#_) {
        my $elem = $_[$_];
        # 渡された要素から１つを選び出し、残った配列を @array とする
        my @array = @_;
        splice(@array, $_, 1);
        # 選び出した１つの要素と、残りの配列から生成される順列をそれぞれ繋げる(再帰処理)
        for my $perm (&permutation($m - 1, @array)) {
            my $result = [$elem, @$perm];
            push(@results, $result);
        }
    }

    return @results;
}

sub mock{
  eval {
    print join("\n",map { join(" ", @$_) } permutation(@_)),"\n"; #permute関数の戻り値がリファで返却されてくるので、デリファする
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
