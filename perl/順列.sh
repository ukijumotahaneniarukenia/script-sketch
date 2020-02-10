#!/bin/bash

#Prerequsite
#$cpanm Math::Combinatorics | tee log
#$echo "export PERL5LIB=/home/sqlite/perl5/lib/perl5:/home/sqlite/perl5/lib/perl5/x86_64-linux-thread-multi" >> ~/.bashrc
#$source ~/.bashrc
#$find / -name "*Combinatorics*" 2>/dev/null
#/home/sqlite/perl5/lib/perl5/Math/Combinatorics.pm
#http://www.mahoroba.ne.jp/~felix/Toolbox/Lang/Perl/Package/Math-Combinatorics.html

#Usage
usage(){
  cat <<EOF
\$cat src
a b
e f
$./順列.sh \$(cat src)
a b e f
a b f e
a e b f
a e f b
a f b e
a f e b
b a e f
b a f e
b e a f
b e f a
b f a e
b f e a
e a b f
e a f b
e b a f
e b f a
e f a b
e f b a
f a b e
f a e b
f b a e
f b e a
f e a b
f e b a
$./順列.sh "\$(cat src)"
b a
a b
f e
e f
$./順列.sh "\$(cat src|tail -n1)"
f e
e f
$./順列.sh "\$(cat src|head -n1)"
b a
a b
$./順列.sh
b a
a b
$./順列.sh
f e
e f
\$cat emoji
💠 💡
💨 💩
$./順列.sh
💩 💨
💨 💩
$./順列.sh
💡 💠
💠 💡
$./順列.sh
💡 💠
💠 💡
💩 💨
💨 💩
$./順列.sh \$(cat emoji | tail -n1)
💩 💨
💨 💩
$./順列.sh \$(cat emoji | head -n1)
💡 💠
💠 💡
$./順列.sh \$(cat emoji)
💠 💡 💨 💩
💠 💡 💩 💨
💠 💨 💡 💩
💠 💨 💩 💡
💠 💩 💡 💨
💠 💩 💨 💡
💡 💠 💨 💩
💡 💠 💩 💨
💡 💨 💠 💩
💡 💨 💩 💠
💡 💩 💠 💨
💡 💩 💨 💠
💨 💠 💡 💩
💨 💠 💩 💡
💨 💡 💠 💩
💨 💡 💩 💠
💨 💩 💠 💡
💨 💩 💡 💠
💩 💠 💡 💨
💩 💠 💨 💡
💩 💡 💠 💨
💩 💡 💨 💠
💩 💨 💠 💡
💩 💨 💡 💠
$./順列.sh "\$(cat emoji)"
💡 💠
💠 💡
💩 💨
💨 💩
EOF
}

perm(){
  local all_ele="$@";
  script=$(cat <<EOF
  use Math::Combinatorics;
  my @array=qw(${all_ele});
  print join("\\\n", map { join " ", @{\$_} } permute(@array)),"\\\n";
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
  while read ln;do perm "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
