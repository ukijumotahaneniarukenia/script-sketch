#!/usr/local/bin/perl5.30.0

#TODOメッセージIDに紐づくテンプレートをはめ込む

sub main{
  print @_, "\n";
  my $msg=shift(@_);
  print $msg, "\n";
  print @_, "\n";
  for my $arg(@_){
    printf "%s:%s,%s", $msg,$arg, "\n";
  };
  printf "%s:%s,%s\n", $msg,@_;
}

main("message",20,30);
