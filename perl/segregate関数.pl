#!/usr/local/bin/perl

use utf8;
use Data::Dumper;
use Encode;

#http://bigfatcat.hateblo.jp/entry/20080120/1200825243
#$perl -e 'use utf8;print utf8::is_utf8('うんこ'),"\n";'
#1
#$perl -e 'use utf8;print utf8::is_utf8('unko'),"\n";'

#$perl -e 'use utf8;print utf8::is_utf8('💩'),"\n";'
#Unrecognized character \x{1f4a9}; marked by <-- HERE after ::is_utf8(<-- HERE near column 30 at -e line 1.


#自作ファンクション使用しない場合 utf-8フラグ付随
#my @ary=(
#  0..9
#  ,'💩'
#  ,A..C
#  ,'💩'
#  ,a..c
#  ,'💩'
#  ,'01'..'10'
#);

#自作ファンクション使用しない場合 utf-8フラグ除去
#my @ary=(
#  0..9
#  ,encode('utf-8','💩')
#  ,A..C
#  ,encode('utf-8','💩')
#  ,a..c
#  ,encode('utf-8','💩')
#  ,'01'..'10'
#);

#グルーピング前の配列を確認
#while(my($ind,$val)=each(@ary)){
#  print $ind.":".$val,"\n";
#}
#print Dumper \@ary;

#カンマ区切りで文字列化
#my $str=join(",",@ary);

#split関数で任意のセパレータ区切りで配列化
#自作ファンクション使用しない場合 utf-8フラグ付随
#my @ary_done=split('💩',$str);
#自作ファンクション使用しない場合 utf-8フラグ除去
#my @ary_done=split(encode('utf-8','💩'),$str);
#
##配列化されていることを確認
#while(my($ind,$val)=each(@ary_done)){
#  print $ind.":".$val,"\n";
#}
#print Dumper \@ary_done;
#
##行頭と行末のカンマを削除
#my @ary_done_done=map{ $_ =~ s/^,|,$//g;$_;} @ary_done;
#
##行頭と行末のカンマが削除されていることを確認
#while(my($ind,$val)=each(@ary_done_done)){
#  print $ind.":".$val,"\n";
#}
#print Dumper \@ary_done_done;

sub segregate{
  my $sep=shift @_;
  my $str=shift @_;
  my $start_pos=0;
  my @liz=();
  while(1){
    $appear_pos=index($str,$sep,$start_pos);
    if($appear_pos==-1){
      push @liz,substr($str,$start_pos,(length($str)-$start_pos));
      return \@liz;
    }
    push @liz,substr($str,$start_pos,($appear_pos-$start_pos));
    $start_pos=$appear_pos+1;
  }
}
#
#自作ファンクション使用する場合 utf-8フラグ除去
my @ary=(
  0..9
  ,encode('utf-8','💩')
  ,A..C
  ,encode('utf-8','💩')
  ,a..c
  ,encode('utf-8','💩')
  ,'01'..'10'
);
#
#自作ファンクション使用する場合 utf-8フラグ付随
#my @ary=(
#  0..9
#  ,'💩'
#  ,A..C
#  ,'💩'
#  ,a..c
#  ,'💩'
#  ,'01'..'10'
#);

#グルーピング前の配列を確認
while(my($ind,$val)=each(@ary)){
  print $ind.":".$val,"\n";
}
print Dumper \@ary;

#カンマ区切りで文字列化
my $str=join(",",@ary);

#自作ファンクションで任意のセパレータ区切りで配列化
#自作ファンクション使用する場合 utf-8フラグ付随
#my $ret=segregate('💩',$str);

#自作ファンクション使用する場合 utf-8フラグ除去
my $ret=segregate(encode('utf-8','💩'),$str);

#配列化されていることを確認
while(my($ind,$val)=each(@{$ret})){
  print $ind.":".$val,"\n";
}
print Dumper $ret;

#行頭と行末のカンマを削除
my @ret_done=map{ $_ =~ s/^,|,$//g;$_;} @{$ret};

#行頭と行末のカンマが削除されていることを確認
while(my($ind,$val)=each(@ret_done)){
  print $ind.":".$val,"\n";
}
print Dumper \@ret_done;
