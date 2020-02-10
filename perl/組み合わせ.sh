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
Usage
$./組み合わせ.sh 2 {a..d}
a b
a c
a d
b c
b d
c d
$./組み合わせ.sh 4 {a..d}
a b c d
$./組み合わせ.sh 1 {a..d}
a
b
c
d
\$echo 2 {a..d} | ./組み合わせ.sh
a b
a c
a d
b c
b d
c d
\$echo 4 {a..d} | ./組み合わせ.sh
a b c d
\$echo 1 {a..d} | ./組み合わせ.sh
a
b
c
d
EOF
}

comb(){
  local fetch_ele="$1";shift;
  local all_ele="$@";
  script=$(cat <<EOF
  use Math::Combinatorics;
  my @array=qw(${all_ele});
  print join("\\\n", map { join " ", @{\$_} } combine(${fetch_ele},@array)),"\\\n";
EOF
  )
  echo -e perl -e "\x27""${script}""\x27" | bash
}

set_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
  fetch_ele="${argv}"
  all_ele="${argv[@]:1}"
}

main(){
  local init_args="$(cat -)";
  set_args "${init_args}"
  comb "${fetch_ele}" "${all_ele}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
