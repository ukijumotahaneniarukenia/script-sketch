#!/usr/local/bin/perl5.30.0

sub stair{
  #複数の引数をリストで受け取る
  my ($mx,$pad) = @_;

  #for ele in (select col from tbl)的なノリ。リストぐるぐる。
  for my $ln (1..$mx) {
    my $sep_str="="x$ln;
    my $sep=sprintf("%".$pad."s",$sep_str);
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
sub print_msg{
  #複数の引数をリストで受け取る
  for my $arg(@_){
    printf("%s",$sep_str);
  }

  my $sep=sprintf("%".$pad."s",$sep_str);
  print $sep,"\n";
}

sub err{
  my ($msg,$arg) = @_;
  if($arg==''){
    die $msg;#引数が不正です。
  }
  die $msg;#
}

sub main{
  #複数の引数をリストで受け取る
  my ($mx,$pad)=@_;
  if($mx==''){
    err("");
  }
  print "aa";
  #print "===========================" ,"\n";
  #print $mx ,"\n";
  #print $pad ,"\n";
  #my @args = @_;
  #my $typ = ref @args;
  #print $typ;
  #stair($mx,$pad);
}

main(10);
#main(10,20);
#main(20,);
#main(,10);
#main(20);
#main(10);
