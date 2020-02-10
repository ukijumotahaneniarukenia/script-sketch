#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$echo {a..d} | ./回転.sh
a b c d
b c d a
c d a b
d a b c
\$echo {d..a} | ./回転.sh
d c b a
c b a d
b a d c
a d c b
\$echo {4..1} | ./回転.sh
4 3 2 1
3 2 1 4
2 1 4 3
1 4 3 2
\$echo {1..4} | ./回転.sh
1 2 3 4
2 3 4 1
3 4 1 2
4 1 2 3
$./回転.sh {1..4}
1 2 3 4
2 3 4 1
3 4 1 2
4 1 2 3
$./回転.sh {4..1}
4 3 2 1
3 2 1 4
2 1 4 3
1 4 3 2
$./回転.sh {a..d}
a b c d
b c d a
c d a b
d a b c
$./回転.sh {d..a}
d c b a
c b a d
b a d c
a d c b
\$cat src | ./回転.sh
a b
b a
e f
f e
$./回転.sh \$(cat src)
a b e f
b e f a
e f a b
f a b e
$./回転.sh "\$(cat src)"
a b
b a
e f
f e
EOF
}

circle(){
  script=$(cat <<EOF
  my @array=qw($@);
  my(\$first,@remain)=@array;
  print(join(" ",@array),"\n");
  for(@remain){
    print(join(" ",@remain,\$first),"\n");
    push(@remain,\$first);
    \$first=shift(@remain);
  }
EOF
  )
  echo -e perl -e "\x27""${script}""\x27" | bash
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
