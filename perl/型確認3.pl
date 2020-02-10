#!/usr/local/bin/perl5.30.0

#複数のカンマ区切り文字を管理する場合はそれぞれをなんらかのグルーピング単位でまあ止めているはずなので、ハッシュ構造を使用する。

print "カンマ区切り文字を要素に含む配列","\n";
print "="x40,"\n";
#この()と[]の違いを抑えたい。上が参照型で、下が参照型以外。

#複数要素
#my $strlist=['grp1'=>'1,2,3,4','grp2'=>'5,6,7','grp3'=>'8,9','grp4'=>'10','grp5'=>''];
#my $strlist=('grp1'=>'1,2,3,4','grp2'=>'5,6,7','grp3'=>'8,9','grp4'=>'10','grp5'=>'');
my $strlist={'grp1'=>'1,2,3,4','grp2'=>'5,6,7','grp3'=>'8,9','grp4'=>'10','grp5'=>''};
#my %strlist=[{'grp1'=>'1,2,3,4','grp2'=>'5,6,7'},{'grp3'=>'8,9','grp4'=>'10'}];
#my %strlist=({'grp1'=>'1,2,3,4','grp2'=>'5,6,7'},{'grp3'=>'8,9','grp4'=>'10'});
#my %strlist={{'grp1'=>'1,2,3,4','grp2'=>'5,6,7'},{'grp3'=>'8,9','grp4'=>'10'}};
#my %strlist=[{'grp1'=>'1,2,3,4','grp2'=>'5,6,7'}];
#my %strlist=({'grp1'=>'1,2,3,4','grp2'=>'5,6,7'});

#単一要素
#my %strlist=['grp1'=>'1,2,3,4'];
#my %strlist=('grp1'=>'1,2,3,4');
#my %strlist={'grp1'=>'1,2,3,4'};
#my %strlist=[{'grp1'=>'1,2,3,4'}];
#my %strlist=({'grp1'=>'1,2,3,4'});
#my %strlist={{'grp1'=>'1,2,3,4'}};
#my %strlist=({});
#my %strlist=[{}];
#my %strlist={{}};

#my %strlist=['grp1'=>'1'];
#my %strlist=('grp1'=>'1');
#my %strlist={'grp1'=>'1'};

#空要素
#my %strlist=[];
#my %strlist=();
#my %strlist={};

print "個数確認:".scalar($strlist),"\n";
print "中身確認:".$strlist,"\n";
print "型確認:"  .\$strlist,"\n";
print "-"x40,"\n";

print %{$strlist},"\n";

while (my($key,$val)=each(%{$strlist})){
  print "中身確認[$key]:".$val,"\n";
  print "型確認:"  . \$val,"\n";
}



print \%{$strlist},"\n";
#print @{$strlist},"\n";

#print $strlist->["grp1"],"\n";


#foreach my $ele($strlist){
#  print "中身確認:". $ele,"\n";
#}
#print "個数確認:".scalar(@strlist),"\n";
#print "中身確認:".@strlist,"\n";
#print "型確認:"  .\@strlist,"\n";
#print "-"x40,"\n";
#
#print \@strlist,"\n";
#foreach my $ele(\@strlist){
#  print "中身確認:". $ele,"\n";
#}
#print "-"x40,"\n";
#foreach my $ind(0..scalar(@array)-1){
#  print "中身確認[$ind]:".@array[$ind],"\n";
#}
#print "-"x40,"\n";
#while (my($ind,$val)=each(@array)){
#  print "中身確認[$ind]:".$val,"\n";
#}

#while (my($key,$val)=each(%strlist)){
#  print "中身確認[$key]:".$val,"\n";
#  print "型確認:"  . \$val,"\n";
#}

#print "カンマ区切り文字を要素に含む配列をスカラ値に型変換","\n";
#いけてないパタン
#print "="x40,"\n";
#my $strlist=@strlist;
#print "個数確認:". scalar($strlist),"\n";
#print "中身確認:". $strlist,"\n";#個数しか得られない。中身見れない。
#print "型確認:"  . \$strlist,"\n";

#print "カンマ区切り文字を要素に含む配列を区切り文字カンマで配列に型変換","\n";
#いけてないパタン
#print "="x40,"\n";
#my @array=split(/,/,@strlist);
#print "個数確認:". scalar(@array),"\n";
#print "中身確認:". @array,"\n";
#print "型確認:"  . \@array,"\n";
#print "-"x40,"\n";
#foreach my $ele(@array){
#  print "中身確認:". $ele,"\n";
#}
#print "-"x40,"\n";
#foreach my $ind(0..scalar(@array)-1){
#  print "中身確認[$ind]:".@array[$ind],"\n";
#}
#print "-"x40,"\n";
#while (my($ind,$val)=each(@array)){
#  print "中身確認[$ind]:".$val,"\n";
#}

#print "カンマ区切り文字のスカラ値を区切り文字カンマで配列に型変換","\n";
##いけてないパタン
#print "="x40,"\n";
#my @array=split(/,/,$strlist);
#print "個数確認:". scalar(@array),"\n";
#print "中身確認:". @array,"\n";
#print "型確認:"  . \@array,"\n";

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
#}
#print "-"x40,"\n";
#foreach my $ind(0..scalar(@array)-1){
#  print "中身確認[$ind]:".@array[$ind],"\n";
#}
#print "-"x40,"\n";
#while (my($ind,$val)=each(@array)){
#  print "中身確認[$ind]:".$val,"\n";
#}
