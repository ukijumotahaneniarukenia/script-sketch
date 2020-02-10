#!/usr/bin/perl

#use Set::Array;

my @a=(1,2,3,4);

my($first,@remain)=@a;

print(join(",",@a),"\n");
for(@remain){
  #print($first,"\n");
  #print(join(",",@remain),"\n");
  print(join(",",@remain,$first),"\n");
  push(@remain,$first);
  $first=shift(@remain);
}


#$rez=$a;
#for ($i=0;$i<3;$i++){
#  print $rez,"\n";
#  $rez=$b;
#}

#my $sao = Set::Array->new(1,2,3);
#my $sao = Set::Array->new(6,5,4);

#print [$sao],"\n";
#print ref($sao),"\n";
#
#print scalar($sao),"\n";
#$result=$sao;
#
#for($ind=0;$ind<$sao->length;$ind++){
#  print "---".join(",",$result->print),"\n";
#  $tmp=Set::Array->new(join(",",$result->rotate));
#  print join(",",$tmp->print)."---","\n";
#my $sao = Set::Array->new(1,2,3);
#
#  #$result=$tmp;
#}

#print $sao->print,"\n";
#print $sao->rotate,"\n";
#print $sao->rotate->rotate,"\n";

#map{print($_->rotate->rotate,"\n")} $sao;


#$cum="\$sao";
#$dyn_cmd_array="";
#for($ind=0;$ind<$sao->length;$ind++){
#  $cum=$cum."->rotate";
#  $dyn_cmd="print(".$cum.",\x22\\n\x22);","\n";
#  print $dyn_cmd,"\n";
#  push($dyn_cmd_array,$dyn_cmd);
#  #for文内での単体実行できない。
#  #eval("$dyn_cmd");
#  #$result=eval("print ".$cum.",\x22\\n\x22;");
#  #print eval("$cum");
#  #print $result,"\n";
#  #print $ind,"\n";
#}
#print($dyn_cmd_array,"\n");
#print(scalar($dyn_cmd_array),"\n");
#print([$dyn_cmd_array],"\n");
##@dyn_cmd_array=split(/,/,substr($dyn_cmd,1,length($dyn_cmd))),"\n";
##print join(",",split(/,/,substr($dyn_cmd,1,length($dyn_cmd)))),"\n";
#
#eval(@{$dyn_cmd_array});
#
##for(@dyn_cmd_array){
##  print $_,"\n";
##  eval("$_");
##}
#
##foreach(my($ind,$val)=each(@dyn_cmd_array)){
##  print $ind,"\n";
##  print $val,"\n";
##
##}
#
#
#
##print($sao->rotate,"\n");
##print($sao->rotate->rotate,"\n");
##print($sao->rotate->rotate->rotate,"\n");
#
#
##うまくいったやつ
##my $dyn_cmd='print($sao->rotate,"\n")',"\n";
##print $dyn_cmd,"\n";
##eval("$dyn_cmd");
