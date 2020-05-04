#!/bin/bash

usage(){
  cat <<EOS
Usage:
  $0 spreadsheet-a.tsv spreadsheet-a-done.tsv
EOS
exit 0
}

AS_IS="$1";shift
TO_BE="$1";shift

[ -z $AS_IS ] && usage
[ -z $TO_BE ] && usage

cat $AS_IS | perl -pe 's;(?<=[A-Z])\n;-;g;'| sed -r  's/\t{2,}//g' | sed '/^$/d' | perl -pe 's/(?<=[A-Z])-$//g' >$TO_BE
