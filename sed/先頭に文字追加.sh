#!/bin/bash

#sed 's;^;create table test_tbl(;' | sed 's;$;)\;;'

usage(){
cat <<EOS
パイプから入力してちょ
Usage:
\$seq 9 | xargs -n3 | tr ' ' ',' | ./先頭に文字追加.sh "insert into test_tbl(\$(../sqlite/テキスト型のカラム列の作成.sh))values(" | ./末尾に文字追加sh ");"
insert into test_tbl(col1 text,col2 text,col3 text)values(1,2,3);
insert into test_tbl(col1 text,col2 text,col3 text)values(4,5,6);
insert into test_tbl(col1 text,col2 text,col3 text)values(7,8,9);
EOS
}

[ -p /dev/stdin ] && cat - | sed "s#^#$@#"
[ -p /dev/stdin ] || usage && exit 1
