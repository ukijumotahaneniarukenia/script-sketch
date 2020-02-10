#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$echo {a..c} | ./スペース区切り文字の行展開.sh
a b c	a
a b c	b
a b c	c
\$echo {c..a} | ./スペース区切り文字の行展開.sh
c b a	c
c b a	b
c b a	a
\$echo {c..c} | ./スペース区切り文字の行展開.sh
c	c
\$echo {1..3} | ./スペース区切り文字の行展開.sh
1 2 3	1
1 2 3	2
1 2 3	3
\$echo {3..1} | ./スペース区切り文字の行展開.sh
3 2 1	3
3 2 1	2
3 2 1	1
\$./スペース区切り文字の行展開.sh {1..3}
1 2 3	1
1 2 3	2
1 2 3	3
\$./スペース区切り文字の行展開.sh {3..1}
3 2 1	3
3 2 1	2
3 2 1	1
\$./スペース区切り文字の行展開.sh {a..c}
a b c	a
a b c	b
a b c	c
\$./スペース区切り文字の行展開.sh {c..a}
c b a	c
c b a	b
c b a	a
\$echo {a..f} | xargs -n3
a b c
d e f
\$cat src
a b c
d e f
\$./スペース区切り文字の行展開.sh $(cat src)
a b c d e f	a
a b c d e f	b
a b c d e f	c
a b c d e f	d
a b c d e f	e
a b c d e f	f
\$./スペース区切り文字の行展開.sh "\$(cat src)"
a b c	a
a b c	b
a b c	c
d e f	d
d e f	e
d e f	f
\$cat emoji
💠 💡
💨 💩
\$./スペース区切り文字の行展開.sh \$(cat emoji)
💠 💡 💨 💩	💠
💠 💡 💨 💩	💡
💠 💡 💨 💩	💨
💠 💡 💨 💩	💩
\$./スペース区切り文字の行展開.sh "\$(cat emoji)"
💠 💡	💠
💠 💡	💡
💨 💩	💨
💨 💩	💩
\$cat emoji | ./スペース区切り文字の行展開.sh
💠 💡	💠
💠 💡	💡
💨 💩	💨
💨 💩	💩
EOF
}

expand(){
  awk '{split($0,array," ")}END{for(ele in array)print $0"\t"array[ele]}'<<<"$@"
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 0 ] && usage && exit 1
}

main(){
  local init_args="$(cat -)"
  chk_args "${init_args}"
  while read ln;do expand "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
