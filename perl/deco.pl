#!/usr/local/bin/perl5.30.0


sub stair{
  #単一の引数の受け取り方
  my $mx=shift @_;

  #for ele in (select col from tbl)的なノリ。リストぐるぐる。
  for my $ln (1..$mx) {
    my $sep_str="="x$ln;
    my $sep=sprintf("%s",$sep_str);
    print $sep,"\n";
  }
}

#sub stair_rev{
#  my $mx=shift @_;
#  for my $ln (reverse(1..$mx)) {
#    my $sep_str="="x$ln;
#    my $sep=sprintf("%s",$sep_str);
#    print $sep,"\n";
#  }
#}

sub main{
  #単一の引数をリストで受け取る
  my ($arg1) = @_;
  stair($arg1);
}

main(10);
