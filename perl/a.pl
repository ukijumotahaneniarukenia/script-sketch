#!/usr/bin/env perl

# 無名関数
my $f = sub {
          print "無名の世界から、こんにちは\n";
        };

# 無名関数を実行
$f->();

# ふつうの関数のように引数も受け取れる
my $ff = sub {
              my ($x, $y) = @_;

              print "$x\n";
              print "$y\n";
            };

# 無名関数を実行
$ff->('無名の世界へ引数を与える', 'こんにちは');

# 無名関数受け取る、名前のある関数
sub hoge {
  my $c = shift;

  print "hoge関数の中です\n";
  $c->();
}


# 無名関数取得
my $fff = sub { print "わたしを誰かよびだして〜\n" };


# 無名関数を引数にして hoge関数を実行
hoge($fff);
