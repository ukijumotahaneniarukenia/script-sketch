#!/usr/bin/env bash

usage(){
  cat <<EOS
Usage:
    $0 3 $(pwd)/test.csv $(pwd)/test.json
EOS

exit 0
}

COL_CNT=$1;shift
CSV_FILE_NAME=$1;shift
JSON_FILE_NAME=$1;shift

[ -z ${COL_CNT} ] && usage
[ -z ${CSV_FILE_NAME} ] && usage
[ -z ${JSON_FILE_NAME} ] && usage

COL_LIST="$(eval echo col@:.[{0..$((COL_CNT-1))}\] | tr ' ' '\n' | nl | awk '{print "sed \x27s/@/"$1"/g\x27 <<<\x22"$2"\x22"}' | sh | xargs | sed -r 's;^;";g;s;:;":;g;s; ;,";g;')"

echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste -d',' $(seq 3 | xargs -I@ echo - | xargs) | head -n10" | sh | perl -pe 's/\x22|\x27//g' >$CSV_FILE_NAME
printf "%s %s\n" "jq -s -R -c 'split(\"\n\")|map(select(.!=\"\"))|map(split(\",\"))|map({$COL_LIST})'" "$CSV_FILE_NAME>$JSON_FILE_NAME" | sh
