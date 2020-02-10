#!/bin/bash
function func ()
{
  echo -e "filename = ${1}"
}
export -f func

find ./ -type f -name "*.pl" | xargs -t -I{} bash -c "func {}"
