#!/usr/local/bin/perl

#my @ary=(a..z);
#my $str=join(",",@ary);
#print $str,"\n";

#print index($str,"a"),"\n";
#print index($str,"b"),"\n";
#print index($str,"c"),"\n";
#
#print substr($str,index($str,"b"),1),"\n";

#a,b,c
#01234
#print index($str,","),"\n";
#print index($str,",",-1),"\n";
#print index($str,",",0),"\n";
#print index($str,",",1),"\n";
#
#print index($str,",",2),"\n";
#print index($str,",",3),"\n";
#print index($str,",",4),"\n";
#
#print index($str,",",length($str)-1),"\n";
#
#print length($str),"\n";

#my @ary=('',,aa,b,cc,'',cc,ddd,Axy,Kuj);
my @ary=(aaa,b,cc,dddd,ff,ggggg);
my $str=join(",",@ary);
print $str,"\n";

#aaa,b,cc
#start_pos:0,appear_pos:3,length:3
#start_pos:4,appear_pos:5,length:1
#start_pos:6,appear_pos:-1,length:2

#my $start_pos=0;
#while(1){
#  $appear_pos=index($str,",",$start_pos);
#  if($appear_pos==-1){
#    print "start_pos:".$start_pos.",appear_pos:".$appear_pos.",length:".(length($str)-$start_pos).",ele:".substr($str,$start_pos,(length($str)-$start_pos)),"\n";
#    #print substr($str,$start_pos,(length($str)-$start_pos));
#    exit;
#  }
#  print "start_pos:".$start_pos.",appear_pos:".$appear_pos.",length:".($appear_pos-$start_pos).",ele:".substr($str,$start_pos,($appear_pos-$start_pos)),"\n";
#  #print substr($str,$start_pos,($appear_pos-$start_pos));
#  $start_pos=$appear_pos+1;
#}

sub segregate{
  my $str=shift @_;
  my $start_pos=0;
  my @liz=();
  while(1){
    $appear_pos=index($str,",",$start_pos);
    if($appear_pos==-1){
      push @liz,substr($str,$start_pos,(length($str)-$start_pos));
      return \@liz;
    }
    push @liz,substr($str,$start_pos,($appear_pos-$start_pos));
    $start_pos=$appear_pos+1;
  }
}

print join("\n",$str),"\n";

my $ret=segregate($str);

print join("\n",@{$ret}),"\n";
