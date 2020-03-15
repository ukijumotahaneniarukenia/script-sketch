#!/bin/bash

echo -ne 🍺うんこUNKOウンコunko産んこＵｎｋｏｳﾝｺ | grep -o .|xxd -c1 -ps|awk 'BEGIN{sm=0;}{if($1=="0a"){print 1,$1}else{print 0,$1}}'|tac|awk 'BEGIN{sm=0;}{sm+=$1;print s,$1,$2}'|tac|awk '{a[$1]=a[$1]","$3}END{for(e in a){gsub(",0a$","",a[e]);gsub("^,","",a[e]); print e,a[e]}}'|sort -nrk1


echo -ne うんこUNKOウンコunko産んこＵｎｋｏｳﾝｺ | perl -CIO -pe 's/(\p{All})/\1\n/g;'|xxd -c1 -ps|awk 'BEGIN{sm=0;}{if($1=="0a"){print 1,$1}else{print 0,$1}}'|tac|awk 'BEGIN{sm=0;}{sm+=$1;print sm,$1,$2}'|tac|awk '{a[$1]=a[$1]","$3}END{for(e in a){print e,a[e]}}'|sort -nk1


echo -ne 🍺うんこUNKOウンコunko産んこＵｎｋｏｳﾝｺ | grep -o .|xxd -c1 -ps|awk 'BEGIN{sm=0;}{if($1=="0a"){print 1,$1}else{print 0,$1}}'|tac|awk 'BEGIN{sm=0;}{sm+=$1;print s,$1,$2}'|tac|awk '{a[$1]=a[$1]","$3}END{for(e in a){gsub(",0a$","",a[e]);gsub("^,","",a[e]); print e,a[e],gsub(",","",a[e])+1}}'|sort -nrk1

cat test.txt | awk '{if(m<gsub(",",",",$1)+1){print $1,gsub(",",",",$1)+1;m=gsub(",",",",$1)+1;}else{print $1,m}}'
f0,9f,8d,ba 4
e3,81,86 4
e3,82,93 4
e3,81,93 4
55 4
4e 4
4b 4
4f 4
