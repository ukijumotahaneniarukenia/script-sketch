#!/usr/local/bin/perl5.30.0

#TODOメッセージIDに紐づくテンプレートをはめ込む

my %msg=(
  '01'=>'printf "エラー,引数にエラーがあります,引数:[%s],メッセージID:[%s]\n"'
  ,'02'=>'エラー,%s,引数:[%s],メッセージID:[%s]\n'
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

sub main{
  my @init_args=@_;
  print(@init_args,"\n");#最初の配列引数を表示
  my @cond=shift(@init_args);#最初の配列引数から先頭要素を取得
  my @result=fetch_msg(@cond);#取得した先頭要素でテーブル検索
  print(@result,"\n");#取得結果の配列から全要素を表示
  my @msg_id=shift(@result);#取得結果の配列から先頭要素を取得
  print(@msg_id,"\n");#取得結果を表示
  print(@init_args,"\n");#最初の配列引数から先頭要素以外を表示
  print(@result,"\n");#取得結果の配列から先頭要素以外を表示
  my @remain_init_args=map {"\x22".$_."\x22"} join(",",@init_args);#引数をダブルクォートで囲こむ
  my @msg_id=map {"\x22".$_."\x22"} join(",",@msg_id);#引数をダブルクォートで囲こむ
  print(@remain_init_args,"\n");#ダブルクォートで囲まれているか確認
  print(@msg_id,"\n");#ダブルクォートで囲まれているか確認
  push(@result,@remain_init_args,@msg_id);#配列resultの後ろにメッセージIDを除いた配列@_とメッセージID配列を結合
  print(join(",",@result),"\n");#配列をカンマ区切りで出力
  my @cmd=join(",",@result);#ダイナミックコマンド
  print(@cmd,"\n");#ダイナミックコマンド確認
  #eval!!!!!ダブルクォートは必要な模様
  eval "@cmd";
}

main('01',20,30);
