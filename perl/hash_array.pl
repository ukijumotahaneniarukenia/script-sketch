#!/usr/local/bin/perl5.30.0

#@は配列
my @nums=(1,2,4);

print @nums,"\n";
#124

print @nums[2],"\n";


#$ドラーはスカラ
my $nums_ref=\@nums;
#リファレンスを返却してくれる
print $nums_ref,"\n";
#ARRAY(0x18a4ba0)

#リファレンスは中身をみることができないので。デリファレンスする。
#https://tutorial.perlzemi.com/blog/20180214151861.html
#@{配列のリファレンス}
print @{$nums_ref},"\n";


#%はハッシュ
my %score = (math => 68, english => 90);
print %score,"\n";


print %score{'math'},"\n";

my $val=%score{'math'};

print $val,"\n";

my @val=%score{'math'};

print "=======================","\n";

print @val[0],"\n";

print @val[1],"\n";


#math68english90
#リファレンスゲット
my $score_ref=\%score;
print $score_ref,"\n";
#HASH(0x8f50c8)


#デリファレンス
print %{$score_ref},"\n";
