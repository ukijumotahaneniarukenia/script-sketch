#!/usr/local/bin/perl5.30.0

use Term::ANSIColor qw( :constants ); $Term::ANSIColor::AUTORESET = 1;
use Data::Dumper;
my $stdin=<STDIN>;
my $strlist=eval($stdin);
#print BRIGHT_GREEN Dumper $strlist,"\n";
while (my($key,$val)=each(@{$strlist})){
  while (my($key,$val)=each(%{$val})){
    push(@rebuild,{$key=>[strlist_2_array($val)]});
  }
}

foreach my $ele(values(@rebuild)){
  while (my($key,$val)=each(%{$ele})){
    while (my($ind,$val)=each(@{$val})){
      $tmpliz=$tmpliz.",".$val;
    }
    $tmphashliz=$tmphashliz.","."{"."\x22".$key."\x22"."=>"."[".substr($tmpliz,1,length($tmpliz))."]"."}";
    $tmpliz="";
  }
}

#@result=eval("[".substr($tmphashliz,1,length($tmphashliz))."]");

print "[".substr($tmphashliz,1,length($tmphashliz))."]","\n";
#print BRIGHT_YELLOW Dumper @result,"\n";

sub strlist_2_array{
  my @strlist=@_;
  my ($strlist)=@strlist;
  my @array=split(/,/,$strlist);
  return @array;
}
