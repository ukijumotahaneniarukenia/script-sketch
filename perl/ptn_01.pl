#!/usr/local/bin/perl5.30.0
#libパス
#$perl -E 'say for @INC'
#/usr/local/lib/perl5/site_perl/5.30.0/x86_64-linux
#/usr/local/lib/perl5/site_perl/5.30.0
#/usr/local/lib/perl5/5.30.0/x86_64-linux
#/usr/local/lib/perl5/5.30.0
#pmファイル
#$find / -name "*ANSI*pm" 2>/dev/null
#/usr/share/perl5/Term/ANSIColor.pm
#/usr/share/perl5/vendor_perl/Pod/Perldoc/ToANSI.pm
#/usr/local/lib/perl5/5.30.0/Term/ANSIColor.pm
#/usr/local/lib/perl5/5.30.0/Pod/Perldoc/ToANSI.pm
#/usr/local/src/perl-5.30.0/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToANSI.pm
#/usr/local/src/perl-5.30.0/cpan/Term-ANSIColor/lib/Term/ANSIColor.pm
#/usr/local/src/perl-5.30.0/lib/Term/ANSIColor.pm
#/usr/local/src/perl-5.30.0/lib/Pod/Perldoc/ToANSI.pm
use Term::ANSIColor qw( :constants ); $Term::ANSIColor::AUTORESET = 1;

use Data::Dumper;

#print BRIGHT_CYAN "サマリ行","\n";
#print BRIGHT_CYAN "="x40,"\n";
#my $strlist=['grp1'=>'1,2,3,4','grp2'=>'5,6,7','grp3'=>'8,9','grp4'=>'10','grp5'=>''];
#配列の中にハッシュ{}が複数
#ハッシュであることを明記したい場合は{}でグルーピングする必要がある
#配列であることを明記したい場合は[]でグルーピングする必要がある
my $strlist=[{'grp1'=>'1,2,3,4'},{'grp2'=>'5,6,7'},{'grp3'=>'8,9'},{'grp4'=>'10'},{'grp5'=>''}];
#print BRIGHT_MAGENTA "スカラ確認結果（スカラ関数経由参照）:".scalar($strlist),"\n";
#print BRIGHT_MAGENTA "スカラ確認結果（直接参照）:".$strlist,"\n";
#print BRIGHT_MAGENTA "リファ確認結果:"  .\$strlist,"\n";
#print BRIGHT_MAGENTA "型確認結果（ref関数経由参照）:".ref($strlist),"\n";
#print BRIGHT_MAGENTA "デリファ確認結果:","\n";
#print BRIGHT_MAGENTA @{$strlist},"\n";
#
#print Dumper $strlist,"\n";
#
#
#
#print BRIGHT_CYAN "明細行","\n";
#print BRIGHT_CYAN "-"x40,"\n";
while (my($key,$val)=each(@{$strlist})){
  print BRIGHT_GREEN "スカラ確認結果（直接参照）[$key]:".$val,"\n";
  print BRIGHT_GREEN "リファ確認結果:" . \$val,"\n";
  print BRIGHT_GREEN "配列展開結果:","\n";
  while (my($key,$val)=each(%{$val})){
    print BRIGHT_RED "スカラ確認結果（直接参照）[$key]:".$val,"\n";
    print BRIGHT_RED "リファ確認結果:" . \$val,"\n";
    print BRIGHT_GREEN UNDERLINE strlist_2_array($val),"\n";
    push(@rebuild,{$key=>[strlist_2_array($val)]});
  }
}

#print Dumper @rebuild,"\n";
#print @rebuild,"\n";
#print ref(\@rebuild),"\n";

  #ハッシュの再構築
  #リファレンス型以外の宣言
    #push(@rebuild,[{$key=>[strlist_2_array($val)]}]);
#
#print BRIGHT_CYAN "="x40,"\n";

#print Dumper @rebuild,"\n";
#print @rebuild,"\n";
#print \@rebuild,"\n";
#
#print keys(@rebuild),"\n";
#print values(@rebuild),"\n";

#my @new_rebuild;

foreach my $ele(values(@rebuild)){
  print $ele,"\n";
  while (my($key,$val)=each(%{$ele})){
    print "key[".$key."]:val[".$val."]","\n";
    while (my($ind,$val)=each(@{$val})){
      $tmpliz=$tmpliz.",".$val;
    }
    #print "key[".$key."]:val[".$val."]".$tmpliz,"\n";
    print "{".$key."=>"."[".substr($tmpliz,1,length($tmpliz))."]"."}","\n";
    $tmphashliz=$tmphashliz.","."{"."\x22".$key."\x22"."=>"."[".substr($tmpliz,1,length($tmpliz))."]"."}";
    $tmpliz="";
  }
}

print "[".substr($tmphashliz,1,length($tmphashliz))."]","\n";

@result=eval("[".substr($tmphashliz,1,length($tmphashliz))."]");
print @result,"\n";
print \@result,"\n";
print Dumper @result,"\n";
#
#my @uuu=[{"grp1"=>[1,2,3,4]},{"grp2"=>[5,6,7]},{"grp3"=>[8,9]},{"grp4"=>[10]},{"grp5"=>[]}];
#print @uuu,"\n";
#print Dumper @uuu,"\n";
#__END__



#
#print keys(@new_build),"\n";
#print Dumper @new_build,"\n";





#push(@new_rebuid,\%rebuild);
#print @new_rebuild,"\n";


#print map{%{$_}} @rebuild;
#print "\n";
#print map{keys(%{$_})} @rebuild;
#print "\n";
#print map{values(%{$_})} @rebuild;
#print "\n";
#print "\n";

##明細確認
#
#print map{$_} @rebuild,"\n";

#print join(",",@rebuild),"\n";
#
##明細確認
#foreach my $outer_ele(@rebuild){
#  print $outer_ele,"\n";
#  foreach my $inner_ele(@{$outer_ele}){
#    print "key:".$outer_ele."===>"."val:".$inner_ele,"\n";
#    while(my($key,$val)=each(%{$inner_ele})){
#      print "[$key]:$val","\n";
#      while (my($ind,$val)=each(@{$val})){
#        print "[$ind]:$val","\n";
#      }
#    }
#  }
#}
#
##サマリ確認
#print BRIGHT_MAGENTA "スカラ確認結果（スカラ関数経由参照）:".scalar(@rebuild),"\n";
#print BRIGHT_MAGENTA "スカラ確認結果（直接参照）:".@rebuild,"\n";
#print BRIGHT_MAGENTA "リファ確認結果:"  .\@rebuild,"\n";
#print BRIGHT_MAGENTA "型確認結果（ref関数経由参照）:".ref(@rebuild),"\n";
#print BRIGHT_MAGENTA "デリファ確認結果:","\n";
#print BRIGHT_MAGENTA @rebuild,"\n";
#
sub strlist_2_array{
  my @strlist=@_;
  #print BRIGHT_GREEN "ファンクション内スカラ確認結果（スカラ関数経由参照）:".scalar(@strlist),"\n";
  #print BRIGHT_GREEN "ファンクション内スカラ確認結果（直接参照）:".@strlist,"\n";
  #print BRIGHT_GREEN "ファンクション内リファ確認結果:"  .\@strlist,"\n";
  my ($strlist)=@strlist;
  my @array=split(/,/,$strlist);
  #while (my($ind,$val)=each(@array)){
  #  print BRIGHT_YELLOW UNDERLINE "ファンクション内スカラ確認結果（直接参照）[$ind]:".$val,"\n";
  #  print BRIGHT_YELLOW UNDERLINE "ファンクション内リファ確認結果:"  .\$val,"\n";
  #}
  return @array;
}
