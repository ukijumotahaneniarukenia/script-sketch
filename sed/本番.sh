#!/bin/bash

circle(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  eval echo '\\\\\\\\U1f4a'{${argv[@]:0:1}..${argv[@]:2:1}} | tr -d ' ' | xargs -I@ bash -c 'echo @ | sed -n -r -e "
  p
  :loop
  s/(\\\U.....){1}(.*)/\2\1/
  p
  /@/!bloop
  "
  ' |sed 's/^/echo -e \x27/;s/$/\x27/' | head -n$argc | sh
}

circle {0..2}
