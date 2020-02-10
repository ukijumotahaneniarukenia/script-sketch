#!/bin/bash
t(){ declare -a v=();local v=($@);local c="${#v[@]}";r="$(eval echo '\\\\\\\\U1f4a'{${v[@]:0:1}..${v[@]:${#v[@]}-1:1}}|tr -d ' '|xargs -I@ bash -c 'echo @ |sed -nre "p;:loop;s/(\\\U.....){1}(.*)/\2\1/;p;/@/!bloop;"'|sed "s/^/echo -e '/;s/$/'/"|head -n$c)";echo "${r}"
};t {0..9} |bash
