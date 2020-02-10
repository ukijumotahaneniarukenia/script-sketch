#!/usr/local/bin/perl5.30.0

#my @strlist=('1,2,3,4');
#
#print "個数確認:".scalar(@strlist),"\n";
#print "中身確認:".@strlist,"\n";
#print "型確認:"  .\@strlist,"\n";
#print "-"x40,"\n";
#foreach my $ele(@strlist){
#  print "中身確認:". $ele,"\n";
#  print "型確認:"  . \$ele,"\n";
#}
#print "-"x40,"\n";
#foreach my $ind(0..scalar(@strlist)-1){
#  print "中身確認[$ind]:".@strlist[$ind],"\n";
#  print "型確認:"  . \@strlist[$ind],"\n";
#}
#print "-"x40,"\n";
#while (my($ind,$val)=each(@strlist)){
#  print "中身確認[$ind]:".$val,"\n";
#  print "型確認:"  . \$val,"\n";
#}

#print "カンマ区切り文字を要素に含む配列をカンマ区切り文字のスカラ値を含むリストに型変換","\n";
###複数だといけてないパタン
#print "="x40,"\n";
#my ($strlist)=@strlist;
#print "個数確認:". scalar($strlist),"\n";
#print "中身確認:". $strlist,"\n";
#print "型確認:"  . \$strlist,"\n";
#
#print "カンマ区切り文字のスカラ値を含むリストを区切り文字カンマで配列に型変換","\n";
#print "="x40,"\n";
##複数だといけてないパタン
#my @array=split(/,/,$strlist);
#print "個数確認:". scalar(@array),"\n";
#print "中身確認:". @array,"\n";
#print "型確認:"  . \@array,"\n";
#print "-"x40,"\n";
#foreach my $ele(@array){
#  print "中身確認:". $ele,"\n";
#  print "型確認:"  . \$ele,"\n";
#}
#print "-"x40,"\n";
#foreach my $ind(0..scalar(@array)-1){
#  print "中身確認[$ind]:".@array[$ind],"\n";
#  print "型確認:"  . \@array[$ind],"\n";
#}
#print "-"x40,"\n";
#while (my($ind,$val)=each(@array)){
#  print "中身確認[$ind]:".$val,"\n";
#  print "型確認:"  . \$val,"\n";
#}
#
#
#print "まとめ","\n";
#print "="x40,"\n";
#my @strlist=('1,2,3,4');
#my ($strlist)=@strlist;
#my @array=split(/,/,$strlist);
#print "個数確認:". scalar(@array),"\n";
#print "中身確認:". @array,"\n";
#print "型確認:"  . \@array,"\n";
#print "-"x40,"\n";
#while (my($ind,$val)=each(@array)){
#  print "中身確認[$ind]:".$val,"\n";
#  print "型確認:"  . \$val,"\n";
#}
#
#
sub strlist_2_array{
  my @strlist=@_;
  print "スカラ確認結果（スカラ関数経由参照）:".scalar(@strlist),"\n";
  print "スカラ確認結果（直接参照）:".@strlist,"\n";
  print "リファ確認結果:".\@strlist,"\n";
  my ($strlist)=@strlist;
  my @array=split(/,/,$strlist);
  while (my($ind,$val)=each(@array)){
    print "スカラ確認結果（直接参照）[$ind]:".$val,"\n";
    print "リファ確認結果:"  . \$val,"\n";
  }
  return @array;
}

#print "ファンクション作成","\n";
my @array=strlist_2_array('1,2,3,4');
print "-"x40,"\n";
print "スカラ確認結果（スカラ関数経由参照）:".scalar(@array),"\n";
print "スカラ確認結果（直接参照）:".@array,"\n";
print "リファ確認結果:".\@array,"\n";

#結果確認
#個数確認:1
#中身確認:1
#型確認:ARRAY(0x1a62d20)
#中身確認[0]:1
#型確認:SCALAR(0x1a70b10)
#中身確認[1]:2
#型確認:SCALAR(0x1a70b10)
#中身確認[2]:3
#型確認:SCALAR(0x1a70b10)
#中身確認[3]:4
#型確認:SCALAR(0x1a70b10)
#----------------------------------------
#個数確認:4
#中身確認:4
#型確認:ARRAY(0x1a62cd8)

