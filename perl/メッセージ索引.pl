#!/usr/local/bin/perl5.30.0

#TODOメッセージIDに紐づくテンプレートをはめ込む

my %msg=(
  '01'=>'エラー,引数[%s]にエラーがあります。'
  ,'02'=>'警告,引数[%s]にエラーがあります。メッセージID:[%s]'
);

#ハッシュテーブル自体を参照するときは%でハッシュテーブルのバリューを参照する場合は$をつける。

sub fetch_msg{
  my ($cond)=@_;
  while(my($key,$value)=each(%msg)){
    if($cond==$key){
      #print($key,$value,"\n");#デバッグ用
      @rt=($key,$value);
    }
  }
  return @rt;
}

sub fetch_msg2{
  my ($cond)=@_;
  for my $key(keys %msg){
    if($cond==$key){
      #print($key,$msg{$key},"\n");#デバッグ用
      @rt=($key,$msg{$key});
    }
  }
  return @rt;
}

sub main{
  my @result=fetch_msg('02');
  print(@result,"\n");
  my @result=fetch_msg2('01');
  print(@result,"\n");
}

main();
