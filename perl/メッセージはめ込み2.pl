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

sub conf_args{
  my %init_args=@_;
  print(%init_args,"\n");#最初のハッシュ引数を表示
  my @msg=%init_args{'msg'};#最初のハッシュ引数からmsg配列を取得
  print(@msg[0],"\n");#msg配列からkeyを表示
  print(@msg[1],"\n");#msg配列からvalを表示
  my @bind_val=%init_args{'bind_val'};#最初のハッシュ引数からbind_val配列を取得
  print(@bind_val[0],"\n");#bind_val配列からkeyを表示
  print(@bind_val[1],"\n");#bind_val配列からvalを表示
}

sub set_args{
  my %init_args=@_;
  my @msg=%init_args{'msg'};#最初のハッシュ引数からmsg配列を取得
  my @bind_val=%init_args{'bind_val'};#最初のハッシュ引数からargs配列を取得
  #変数関数外でも参照できるようにオープン
  @msg_id=@msg[1];
  @bind_list=@bind_val[1];
  #print(@msg_id,"\n");
  #print(@bind_list,"\n");
}

sub conf_val{
  print(join(",",@_),"\n");
}

sub build_dyn_cmd{
  #第一引数:マージ先配列
  #上記以外:マージ元配列
  #変数関数外でも参照できるようにオープン
  @tgt=shift(@_);
  push(@tgt,@_);
  return join(",",@tgt);
}

sub make_dyn_cmd_args{
  @dyn_cmd_args=map {"\x22".$_."\x22"} join(",",@_);#引数をダブルクォートで囲こむ
  return join(",",@dyn_cmd_args);
}

sub exec_dyn_cmd{
  ##eval!!!!!ダブルクォートは必要な模様
  eval("@_");
}

sub main{
  conf_args(@_);
  set_args(@_);
  conf_val(@msg_id);
  conf_val(@bind_list);

  my @cond=@msg_id;#検索条件に設定
  conf_val(@cond);

  my @result=fetch_msg(@cond);#取得した先頭要素でテーブル検索
  conf_val(@result);#取得結果の配列から全要素を表示
  shift(@result);#取得結果の配列から先頭要素を取得
  conf_val(@result);#取得結果の配列から先頭要素以外を表示

  my @msg_id_with_dqt=make_dyn_cmd_args(@msg_id);
  my @bind_list_with_dqt=make_dyn_cmd_args(@msg_id);
  conf_val(@bind_list_with_dqt);#ダブルクォートで囲まれているか確認
  conf_val(@msg_id_with_dqt);#ダブルクォートで囲まれているか確認

  my @dyn_cmd=build_dyn_cmd(@result,@bind_list_with_dqt,@msg_id_with_dqt);
  conf_val(@dyn_cmd);#ダイナミックコマンド確認
  exec_dyn_cmd(@dyn_cmd);#ダイナミックコマンド実行
}

main('msg'=>'01','bind_val'=>'20,30');
