#!/usr/local/bin/perl5.30.0

print "="x40,"\n";
print "カンマ区切り文字を要素に含む配列","\n";
my @strlist=('1,2,3,4');
print "個数確認:".scalar(@strlist),"\n";
print "中身確認:".@strlist,"\n";
print "型確認:"  .\@strlist,"\n";

print "="x40,"\n";
print "カンマ区切り文字を要素に含む配列をスカラ値に型変換","\n";
my $strlist=@strlist;
print "個数確認:". scalar($strlist),"\n";
print "中身確認:". $strlist,"\n";
print "型確認:"  . \$strlist,"\n";

print "="x40,"\n";
print "カンマ区切り文字を要素に含む配列を区切り文字カンマで配列に型変換","\n";
my @array=split(/,/,@strlist);
print "個数確認:". scalar(@array),"\n";
print "中身確認:". @array,"\n";
print "型確認:"  . \@array,"\n";

print "="x40,"\n";
print "カンマ区切り文字のスカラ値を区切り文字カンマで配列に型変換","\n";
my @array=split(/,/,$strlist);
print "個数確認:". scalar(@array),"\n";
print "中身確認:". @array,"\n";
print "型確認:"  . \@array,"\n";

print "="x40,"\n";
print "カンマ区切り文字を要素に含む配列をスカラ値をカンマ区切り文字のスカラ値を含むリストに型変換","\n";
my ($strlist)=@strlist;
print "個数確認:". scalar($strlist),"\n";
print "中身確認:". $strlist,"\n";
print "型確認:"  . \$strlist,"\n";

print "="x40,"\n";
print "カンマ区切り文字のスカラ値を含むリストを区切り文字カンマで配列に型変換","\n";
my @array=split(/,/,$strlist);
print "個数確認:". scalar(@array),"\n";
print "-"x40,"\n";
foreach my $ele(@array){
  print "中身確認:". $ele,"\n";
}
print "-"x40,"\n";
foreach my $ind(0..scalar(@array)-1){
  print "中身確認[$ind]:".@array[$ind],"\n";
}
print "-"x40,"\n";
while (my($ind,$val)=each(@array)){
  print "中身確認[$ind]:".$val,"\n";
}
print "型確認:"  . \@array,"\n";
