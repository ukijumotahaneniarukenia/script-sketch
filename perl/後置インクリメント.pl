#!/usr/local/bin/perl
#
##http://blog.livedoor.jp/dankogai/archives/51441112.html
#
#sub post_incr{
#  for(@_){
#    print $_,"\n";
#  } 
#}
#
##post_incr(0..10);
#
#sub post_incr2(\@\@){
#  my($lft,$rgt)=@_;
#  print $lft,"\n";
#  #for(@_){
#  #  print $_,"\n";
#  #} 
#}
#
##@lft=(0..10);
##@rgt=(3..7);
##post_incr2(@lft,@rgt);
#
#
#sub post_incr3{
#  my($lft,$rgt)=@_;
#  print $lft,"\n";
#  print $rgt,"\n";
#  print @{$lft},"\n";
#  print @{$rgt},"\n";
#  print join(",",@{$lft}),"\n";
#  print join(",",@{$rgt}),"\n";
#  #for(@_){
#  #  print $_,"\n";
#  #} 
#}
#
##@lft=(0..10);
##@rgt=(3..7);
##post_incr3(@lft,@rgt);
#
#
##Too many arguments for main::post_incr4 at ./後置インクリメント.pl line 56, near "@rgt)"
#sub post_incr4(){
##コンパイルエラー
#  my($lft,$rgt)=@_;
#  print $lft,"\n";
#  print $rgt,"\n";
#  print @{$lft},"\n";
#  print @{$rgt},"\n";
#  print join(",",@{$lft}),"\n";
#  print join(",",@{$rgt}),"\n";
#  #for(@_){
#  #  print $_,"\n";
#  #} 
#}
#
##@lft=(0..10);
##@rgt=(3..7);
##post_incr4(@lft,@rgt);
#
##Too many arguments for main::post_incr5 at ./後置インクリメント.pl line 71, near "@rgt)"
#sub post_incr5(\@){
##コンパイルエラー
#  my($lft,$rgt)=@_;
#  print $lft,"\n";
#  print $rgt,"\n";
#  print @{$lft},"\n";
#  print @{$rgt},"\n";
#  print join(",",@{$lft}),"\n";
#  print join(",",@{$rgt}),"\n";
#  #for(@_){
#  #  print $_,"\n";
#  #} 
#}
#
##@lft=(0..10);
##@rgt=(3..7);
##post_incr5(@lft,@rgt);
#
#sub post_incr6(\@\@){
##コンパイルエラー
#  my($lft,$rgt)=@_;
#  print $lft,"\n";
#  print $rgt,"\n";
#  print @{$lft},"\n";
#  print @{$rgt},"\n";
#  print join(",",@{$lft}),"\n";
#  print join(",",@{$rgt}),"\n";
#  #for(@_){
#  #  print $_,"\n";
#  #} 
#}
#
##@lft=(0..10);
##@rgt=(3..7);
##post_incr6(@lft,@rgt);
#
#sub post_incr7(){
##コンパイルエラー
#  my($lft,$rgt)=@_;
#  print $lft,"\n";
#  print $rgt,"\n";
#  print @{$lft},"\n";
#  print @{$rgt},"\n";
#  print join(",",@{$lft}),"\n";
#  print join(",",@{$rgt}),"\n";
#  #for(@_){
#  #  print $_,"\n";
#  #} 
#}

#https://tweeeety.hateblo.jp/entry/2015/02/16/174445

use Data::Dumper;

my @lft=(1..10);

#@rgt=(3..7);
#post_incr7(@lft,@rgt);
#print map{$_} @lft,"\n";
#番外編のやつ
#https://donow.jp/skillup/?p=1212

#print map{'grp'.$_=>1} @lft,"\n";

my %hash=map{'grp'.$_=>1} @lft;

print Dumper \%hash;

my $hash_ref=\%hash;

print Dumper $hash_ref;


#
#print [map{{'grp'.$_=>1}} @lft],"\n";

#my $single_hash_array=[join(",",map{{'grp'.$_=>'1'}} @lft)];
#
#print Dumper $single_hash_array;

#my @array=strlist_2_array($single_hash_array);
#print "-"x40,"\n";
#print "スカラ確認結果（スカラ関数経由参照）:".scalar(@array),"\n";
#print "スカラ確認結果（直接参照）:".@array,"\n";
#print "リファ確認結果:".\@array,"\n";

#my @multiple_hash_array=split(/,/,join(",",map{{'grp'.$_=>1}} @lft));
#
#print Dumper @multiple_hash_array;
#
#
#print @multiple_hash_array,"\n";


#my $lft_hash_array=map{{'grp'.$_=>1}} @lft;

#print Dumper map{{'grp'.$_=>1}} @lft;

#print Dumper $lft_hash_array;
#
#
##print "ファンクション作成","\n";
#my @array=strlist_2_array($lft_hash_array);
#print scalar(@array),"\n";
#
#while(my($ind,$val)=each(@array)){
#  print $ind.":".$val,"\n";
#}
#
#my $hash=({'grp1'=>1});
#
#print $hash,"\n";

#print Dumper @array;


#my $lft_done=map{{'grp'.$_=>1}} @lft;
#
#print Dumper map{{'grp'.$_=>1}} @lft;

#my $lft_done=map{{'grp'.$_=>1}} @lft;

#print $lft_done,"\n";


#print $lft_hash_array,"\n";

#foreach my $ele(@{$lft_hash_array}){
#  print $ele,"\n";
#  #単一要素になっていない
#  print Dumper $ele;
#}

#print Dumper map{{'grp'.$_=>1}} @lft;
#print $lft_done,"\n";
#
#print [$lft_done],"\n";
#
#print @{$lft_done},"\n";
#

#use Term::ANSIColor qw( :constants ); $Term::ANSIColor::AUTORESET = 1;
#use Data::Dumper;
#
#my $strlist=[{'grp1'=>'1,2,3,4'},{'grp2'=>'5,6,7'},{'grp3'=>'8,9'},{'grp4'=>'10'},{'grp5'=>''}];
#
#while (my($ind,$val)=each(@{$strlist})){
#  print BRIGHT_GREEN "スカラ確認結果（直接参照）[$ind]:".$val,"\n";
#  print BRIGHT_GREEN "リファ確認結果:" . \$val,"\n";
#  print BRIGHT_GREEN "配列展開結果:","\n";
#  while (my($key,$val)=each(%{$val})){
#    print BRIGHT_RED "スカラ確認結果（直接参照）[$key]:".$val,"\n";
#    print BRIGHT_RED "リファ確認結果:" . \$val,"\n";
#    print BRIGHT_GREEN UNDERLINE strlist_2_array($val),"\n";
#    push(@rebuild,{$key=>[strlist_2_array($val)]});
#  }
#}
