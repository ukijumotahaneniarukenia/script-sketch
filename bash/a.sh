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



#https://rcmdnk.com/blog/2014/01/15/computer-bash-zsh_2/

#aaaaの出力さきを制御端末ファイルに向ける
#echo aaaaa >/dev/tty

#ログファイルには書き込まれない
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:08) ~/script_scratch/bash]$./a.sh >log
#aaaaa
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:13) ~/script_scratch/bash]$cat log
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:15) ~/script_scratch/bash]$


#aaaaの出力さきを標準出力に向ける
#echo aaaaa

#ログファイルには書き込まれる
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:50) ~/script_scratch/bash]$./a.sh >log
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:51) ~/script_scratch/bash]$cat log
#aaaaa


#aaaaの出力先を標準エラー出力に向ける
echo aaaaa 1>&2


#ログファイルには書き込まれない
#[sqlite💞ceacf3fb0808 (日 11月 03 13:57:23) ~/script_scratch/bash]$./a.sh >log
#aaaaa
#[sqlite💞ceacf3fb0808 (日 11月 03 13:57:25) ~/script_scratch/bash]$cat log

