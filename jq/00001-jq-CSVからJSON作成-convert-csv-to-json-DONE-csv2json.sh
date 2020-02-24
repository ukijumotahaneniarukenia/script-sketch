#!/usr/bin/env bash

usage(){
  cat <<EOS
Usage:
    $0 test.csv test.json
EOS

exit 0
}

CSV_FILE_NAME=$1;shift
JSON_FILE_NAME=$1;shift

[ -z ${CSV_FILE_NAME} ] && usage
[ -z ${JSON_FILE_NAME} ] && usage

COL_CNT=$(awk -v FS=',' 'END{print NF}' $CSV_FILE_NAME)

COL_LIST="$(eval echo col@:.[{0..$((COL_CNT-1))}\] | tr ' ' '\n' | nl | awk '{print "sed \x27s/@/"$1"/g\x27 <<<\x22"$2"\x22"}' | sh | xargs | sed -r 's;^;";g;s;:;":;g;s; ;,";g;')"
printf "%s %s\n" "jq -s -R -c 'split(\"\n\")|map(select(.!=\"\"))|map(split(\",\"))|map({$COL_LIST})'" "$CSV_FILE_NAME>$JSON_FILE_NAME" | sh
