#!/usr/local/bin/perl5.30.0

use Term::ANSIColor qw( :constants ); $Term::ANSIColor::AUTORESET = 1;
use Data::Dumper;

my $strlist=[{'grp1'=>'1,2,3,4'},{'grp2'=>'5,6,7'},{'grp3'=>'8,9'},{'grp4'=>'10'},{'grp5'=>''}];

while (my($ind,$val)=each(@{$strlist})){
  print BRIGHT_GREEN "スカラ確認結果（直接参照）[$ind]:".$val,"\n";
  print BRIGHT_GREEN "リファ確認結果:" . \$val,"\n";
  print BRIGHT_GREEN "配列展開結果:","\n";
  while (my($key,$val)=each(%{$val})){
    print BRIGHT_RED "スカラ確認結果（直接参照）[$key]:".$val,"\n";
    print BRIGHT_RED "リファ確認結果:" . \$val,"\n";
    print BRIGHT_GREEN UNDERLINE strlist_2_array($val),"\n";
    push(@rebuild,{$key=>[strlist_2_array($val)]});
  }
}

print Dumper @rebuild,"\n";
print @rebuild,"\n";
print ref(\@rebuild),"\n";

sub strlist_2_array{
  my @strlist=@_;
  my ($strlist)=@strlist;
  my @array=split(/,/,$strlist);
  return @array;
}
