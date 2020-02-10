#!/usr/local/bin/perl5.30.0

#配列ハッシュ
my %msg=(
  '01'=>'printf "エラー,引数にエラーがあります,引数:[%s],メッセージID:[%s]\n"'
  ,'02'=>'printf "エラー,%s,引数:[%s],メッセージID:[%s]\n"'
);

#配列ハッシュ
my %msg_args=(
  #msg_idは主キーなので文言は絶対ハード!!!!それ以外はソフト。
  '01'=>'bind_val'
  ,'02'=>'msg_str,bind_val'
);

sub fetch_msg{
  #conf_val(@_);
  my ($id,$tbl)=@_;
  #conf_val($id);
  #conf_val($tbl);
  #eval内で実行する式の実行結果を後続の処理で参照する際には、オープンにしておく。
  my $dyn_cmd='$dyn_cmd_result=grep{$_=='."\x22".$id."\x22".'} keys(%'.$tbl.');';
  #conf_val($dyn_cmd);
  #ヒットすると1が返却されてくる。ヒットしないと0が返却される。
  exec_dyn_cmd($dyn_cmd);
  #conf_val($dyn_cmd_result);
  if(1==$dyn_cmd_result){
    my $dyn_cmd='$dyn_cmd_result=join(",",'.'%'.$tbl.'{'."\x22".$id."\x22".'})', "\n";
    #conf_val($dyn_cmd);
    exec_dyn_cmd($dyn_cmd);
    #conf_val($dyn_cmd_result);
    my $dyn_cmd='@dyn_cmd_result=split(/,/,'.'%'.$tbl.'{'."\x22".$id."\x22".'})', "\n";
    #conf_val($dyn_cmd);
    exec_dyn_cmd($dyn_cmd);
  }
  @rt=join(",",@dyn_cmd_result),"\n";
  return @rt;
}

sub make_comma_strlist_2_array{
  conf_val(@_);
  my @array=split(/,/,@_);
  #conf_val(@array);
  #for my $ele(@_){
  #  #配列引数からスカラ値を取り出して配列検索条件格納
  #  push(@criteria,$ele);
  #}
  ##conf_val(@criteria);
  #return @criteria;
}

sub make_array{
  #conf_val(@_);
  for my $ele(@_){
    #配列引数からスカラ値を取り出して配列検索条件格納
    push(@criteria,$ele);
  }
  #conf_val(@criteria);
  return @criteria;
}

sub conf_args{

  #msg_argsテーブルを参照して番号ごとに動的に引数から値を取得する

  my %init_args=@_;
  my @msg_id=%init_args{'msg_id'};#最初のハッシュ引数からmsg_id配列を取得
  #conf_val(@msg_id[0]);#msg_id配列からkeyを表示
  #conf_val(@msg_id[1]);#msg_id配列からvalを表示
  
  my @criteria=make_array(@msg_id[1],'msg_args');#検索条件を設定
  #conf_val(@criteria);
  my @result=fetch_msg(@criteria);#検索条件を元にテーブル検索
  #conf_val(@result);#取得結果の配列から全要素を表示
  #テーブルより取得した検索条件項目が引数に指定されているかチェック
  #existsチェック
  print %init_args,"\n";
  print @result,"\n";
  make_comma_strlist_2_array(@result);
  #print @result,"\n";
  #foreach my $ele(@result){
  #  print $ele,"\n";
  #}
  #shift(@result);#取得結果の配列から先頭要素を取得
  #conf_val(@result);#取得結果の配列から先頭要素以外を表示

  #my @bind_val=%init_args{'bind_val'};#最初のハッシュ引数からbind_val配列を取得
  #print(@bind_val[0],"\n");#bind_val配列からkeyを表示
  #print(@bind_val[1],"\n");#bind_val配列からvalを表示
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
  #set_args(@_);
  #conf_val(@msg_id);
  #conf_val(@bind_list);

  #my @cond=@msg_id;#検索条件に設定
  #conf_val(@cond);

  #my @result=fetch_msg(@cond);#取得した先頭要素でテーブル検索
  #conf_val(@result);#取得結果の配列から全要素を表示
  #shift(@result);#取得結果の配列から先頭要素を取得
  #conf_val(@result);#取得結果の配列から先頭要素以外を表示

  #my @msg_id_with_dqt=make_dyn_cmd_args(@msg_id);
  #my @bind_list_with_dqt=make_dyn_cmd_args(@msg_id);
  #conf_val(@bind_list_with_dqt);#ダブルクォートで囲まれているか確認
  #conf_val(@msg_id_with_dqt);#ダブルクォートで囲まれているか確認

  #my @dyn_cmd=build_dyn_cmd(@result,@bind_list_with_dqt,@msg_id_with_dqt);
  #conf_val(@dyn_cmd);#ダイナミックコマンド確認
  #exec_dyn_cmd(@dyn_cmd);#ダイナミックコマンド実行
}

#main('msg_id'=>'01','bind_val'=>'20,30');
main('msg_id'=>'02','bind_val'=>'20,30');
