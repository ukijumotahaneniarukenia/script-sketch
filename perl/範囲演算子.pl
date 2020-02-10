#!/usr/local/bin/perl

#https://perldoc.jp/docs/perl/perlop.pod
#https://tutorial.perlzemi.com/blog/20180530152777.html

#https://perldoc.jp/docs/perl/perlop.pod#Range32Operators

#正順
#my @array=(A..Z);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(a..z);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(0..10);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(11..20);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(AA..ZZ);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(aa..zz);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(0..9,a..f);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=(0..9,A..F);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=('01'..'10');
#print join(",",@array),"\n";
#print scalar(@array),"\n";

#逆順
#my @array=reverse(A..Z);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(a..z);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(0..10);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(11..20);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(AA..ZZ);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(aa..zz);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(0..9,a..f);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse(0..9,A..F);
#print join(",",@array),"\n";
#print scalar(@array),"\n";
#my @array=reverse('01'..'10');
#print join(",",@array),"\n";
#print scalar(@array),"\n";

#my @array=(0..9,'💩',A..C,a..c,'01'..'10',AA..CC,Aa..Cc,aA..cC);
#print join(",",@array),"\n";

#my @array=(0..9
#  ,'💩'
#  ,A..C
#  ,'💩'
#  ,a..c
#  ,'💩'
#  ,'01'..'10'
#  ,'💩'
#  ,AA..CC
#  ,'💩'
#  ,Aa..Cc
#  ,'💩'
#  ,aA..cC
#);
#
#use Data::Dumper;
#
#my $array=[(a..c)];
#
##print @{$array},"\n";
#
my @ary=(a..c);
my $str=join(",",@ary);
print $str,"\n";
print index($str,"a"),"\n";
print index($str,"b"),"\n";
print index($str,"c"),"\n";

print substr($str,index($str,"b"),1),"\n";



#my %hash=map{$_=>1}(a..c);
#
#
#print Dumper \%hash;

#print join(",",@array),"\n";
