#!/usr/bin/env bash

usage(){
  cat <<EOS
Usage:
    $0 3 10 20 30 test.csv
EOS

exit 0
}

COL_CNT=$1;shift
ROW_CNT=$1;shift
RANDOM_START=$1;shift
RANDOM_END=$1;shift
CSV_FILE_NAME=$1;shift

[ -z ${COL_CNT} ] && usage
[ -z ${ROW_CNT} ] && usage
[ -z ${RANDOM_START} ] && usage
[ -z ${RANDOM_END} ] && usage
[ -z ${CSV_FILE_NAME} ] && usage

for i in {0..1000000};do
  echo {{a..z},{A..Z},{0..9}} |& tr ' ' \\n|shuf -rn$(seq $RANDOM_START $RANDOM_END |& shuf -rn1) |& tr -d \\n;
  echo;
done |& xargs -n"$COL_CNT" |& head -n"$ROW_CNT" 13>/dev/null | perl -pe 's; ;,;g' >$CSV_FILE_NAME
