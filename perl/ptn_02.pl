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
use Term::ANSIColor qw( :constants );
$Term::ANSIColor::AUTORESET = 1;

my $strlist=('grp1'=>'1,2,3,4','grp2'=>'5,6,7','grp3'=>'8,9','grp4'=>'10','grp5'=>'');
print BRIGHT_MAGENTA "スカラ確認結果（スカラ関数経由参照）:".scalar($strlist),"\n";
print BRIGHT_MAGENTA "スカラ確認結果（直接参照）:".$strlist,"\n";
print BRIGHT_MAGENTA "リファ確認結果:"  .\$strlist,"\n";
print BRIGHT_MAGENTA "型確認結果（ref関数経由参照）:".ref($strlist),"\n";
print BRIGHT_MAGENTA "デリファ確認結果:","\n";
print BRIGHT_MAGENTA %{$strlist},"\n";

print "-"x40,"\n";
while (my($key,$val)=each(%{$strlist})){
  print BRIGHT_GREEN "スカラ確認結果（直接参照）[$key]:".$val,"\n";
  print BRIGHT_GREEN "リファ確認結果:" . \$val,"\n";
  print BRIGHT_GREEN "配列展開結果:","\n";
  print BRIGHT_GREEN UNDERLINE strlist_2_array($val),"\n";
}

sub strlist_2_array{
  my @strlist=@_;
  print BRIGHT_YELLOW "スカラ確認結果（スカラ関数経由参照）:".scalar(@strlist),"\n";
  print BRIGHT_YELLOW "スカラ確認結果（直接参照）:".@strlist,"\n";
  print BRIGHT_YELLOW "リファ確認結果:"  .\@strlist,"\n";
  my ($strlist)=@strlist;
  my @array=split(/,/,$strlist);
  while (my($ind,$val)=each(@array)){
    print BRIGHT_CYAN UNDERLINE "スカラ確認結果（直接参照）[$ind]:".$val,"\n";
    print BRIGHT_CYAN UNDERLINE "リファ確認結果:"  .\$val,"\n";
  }
  return @array;
}
