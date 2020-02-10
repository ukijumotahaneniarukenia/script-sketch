#!/bin/bash

#[]で型確認できる
#qw演算子
echo {a..c} | xargs -I@ perl -E 'print([qw(@)],"\n");'
echo {a..c} | xargs -I@ perl -E 'print(qw(@),"\n");'
echo {a..c} | xargs -I@ perl -E 'print(join(",",qw(@)),"\n");'
echo {a..c} | xargs -I@ perl -E 'print(join("\n",qw(@)),"\n");'
echo {a..c} | xargs -I# perl -E 'my @array=qw(#);while(my($ind,$val)=each(@array)){print $ind.":".$val,"\n"};'
echo {a..c} | xargs -I# perl -E 'my @array=qw(#);foreach my $ele(@array){print $ele,"\n"};'
echo {c..a} | xargs -I# perl -E 'my @array=qw(#);$cum=();foreach my $ele(@array){$cum=$cum.$ele;print $cum,"\n"};'
echo {a..c} | xargs -I# perl -E 'my @array=qw(#);$cum=();foreach my $ele(@array){$cum=$cum.$ele;print $cum,"\n"};'
echo {a..f} | xargs -I# perl -E 'my @array=qw(#);while(my($ind,$val)=each(@array)){print $ind.":".$val."$val"x$ind,"\n"};'
echo -e '\U1F4A'{{a..f},{0..9}} | xargs -I# perl -E 'my @array=qw(#);while(my($ind,$val)=each(@array)){print $ind.":".$val."$val"x$ind,"\n"};'
echo {a..c} | tr ' ' ',' | xargs -I# perl -E 'my $array=[#];while(my($ind,$val)=each(@{$array})){print $ind.":"."$val"x eval($ind+1),"\n"}'
echo {a..o} | tr ' ' ',' | xargs -I# perl -e 'my $array=[#];while(my($ind,$val)=each(@{$array})){print $ind.":"."$val"x eval($ind+1),"\n"}'
