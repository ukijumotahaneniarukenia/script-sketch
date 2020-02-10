#!/usr/local/bin/perl

# 関数のダイナミック呼び出し
# https://signe.hatenadiary.org/entry/20090624/p1

# https://genzouw.com/entry/2019/10/09/182532

sub usage{
  my $msg=<<"USAGE";
Usage:
\$./for文.pl 10 ptn{1..10}_{1..2}
\$./for文.pl 3 ptn{3..4}_{1..2}
\$./for文.pl 3 ptn{3..4}_{1..1}
\$echo 1 ptn{1..1}_{1..2} | ./for文.pl
\$echo 9 ptn{10..10}_{1..1} ptn{3..3}_{1..1} | ./for文.pl
USAGE
  print $msg,"\n";
  exit 1;
}

sub chk_args{
  if(scalar(@_)==0){
    #引数個数チェック
    usage();
  }
  my($first,@remain)=@_;
  if($first == 0){
    #ゼロチェック
    usage();
  }
  if($first !~ /[0-9]+/){
    #数値チェック
    usage();
  }
  for(@remain){
    if($_ !~ /^ptn[0-9]{1,}_[0-9]{1,}$/){
      #コマンド文字列形式チェック
      usage();
    }
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

sub main_process{
  my($first,@remain)=@_;
  print $first,"\n";
  print join(",",@remain),"\n";
  for(@remain){
    print $_,"\n";
    print $_."(".$first.")","\n";
    print "="x40,"\n";
    eval($_."(".$first.")");
    if($@){
      print "Error:".$@,"\n";
      usage();
    }
  }
}

sub post_process{
  print "perl楽しい","\n";
}

sub main{
  my @pre_done_args=pre_process();
  main_process(@pre_done_args);
  post_process();
}

main();

#  収束

##  外側のループに束縛を受けないパターン

###  単調増加

sub ptn1_1{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=1;$j<=$num;$j++){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn1_2{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=1;$j<=$num;$j++){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

###  単調減少
sub ptn2_1{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=$num;$j>0;$j--){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn2_2{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=$num;$j>0;$j--){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

## 外側のループに束縛を受けるパターン

# 初期値のみに束縛を受ける
sub ptn3_1{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=$i;$j>0;$j--){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn3_2{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=$i;$j>0;$j--){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

## 初期値と終了値に束縛を受ける
sub ptn4_1{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=$i;$j>=$i;$j--){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn4_2{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=$i;$j>=$i;$j--){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

## 終了値のみに束縛を受ける
sub ptn5_1{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=1;$j<=$i;$j++){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn5_2{
  my $num=shift @_;
  for(my $i=$num;$i>0;$i--){
    for(my $j=1;$j<=$i;$j++){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}


# 発散

## 外側のループに束縛を受けないパターン

### 単調増加
sub ptn6_1{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=1;$j<=$num;$j++){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn6_2{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=1;$j<=$num;$j++){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

### 単調減少
sub ptn7_1{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=$num;$j>0;$j--){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn7_2{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=$num;$j>0;$j--){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

## 外側のループに束縛を受けるパターン

### 初期値のみに束縛を受ける
sub ptn8_1{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=$i;$j>0;$j--){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

sub ptn8_2{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=$i;$j>0;$j--){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

### 初期値と終了値に束縛を受ける
sub ptn9_1{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=$i;$j<=$i;$j++){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn9_2{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=$i;$j<=$i;$j++){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}

### 終了値のみに束縛を受ける
sub ptn10_1{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=1;$j<=$i;$j++){
      print "$i:$j"."\t"."$i"x$j,"\n";
    }
  }
}

sub ptn10_2{
  my $num=shift @_;
  for(my $i=1;$i<=$num;$i++){
    for(my $j=1;$j<=$i;$j++){
      print "$j:$i"."\t"."$j"x$i,"\n";
    }
  }
}
