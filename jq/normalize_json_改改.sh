#!/bin/bash

exec 2>&1

normalize_json(){
  FILE="$@"
  START_MSG="printf \"ファイル[%s]の処理を開始します。\n\" @ "
  END_MSG="printf \"ファイル[%s]の処理を終了します。\n\" @ "
  RESULT_FMT="printf \"%s=%s\n\" KEY VALUE"
  NO_RESULT_FMT="printf \"%s=%s\n\" KEY VALUE"
  CMD="cat $FILE | jq -cr '@'"
  
  echo "$START_MSG" | sed "s;@;$FILE;" | bash
  cat "$FILE" | jq -r 'paths|map(if type=="number" then "["+tostring+"]" else "."+tojson end)|join("")' | sed 's;^\.;;' | sed 's;^;\.;' |\
    while read ln;do
      #デバッグ用
      #cat $FILE | jq '.'
      #tojson関数は記号文字をエスケープしてくれるので、便利
      #デバッグ用
      #RESULT=$(cat $FILE | jq -cr "$ln|if type==\"string\" or type==\"number\" or type==\"null\" or type==\"boolean\" or type==\"array\" or type==\"object\" then tojson else empty end" | sed '/^$/d')
      RESULT=$(cat $FILE | jq -cr "$ln|if type==\"string\" or type==\"number\" or type==\"null\" or type==\"boolean\" then tojson else empty end" | sed '/^$/d')
      #ドッと関数は直前の標準入力をそのまま出力してくれるので、事故る
      #RESULT=$(cat $FILE | jq -cr "$ln|if type==\"string\" or type==\"number\" then . else empty end" | sed '/^$/d')
      #デバッグ用
      #printf "%s \n" "$(echo "$CMD" | sed "s;@;$ln;")"
      if [ "MATCH$RESULT" != "MATCH" ]; then
        echo "$RESULT_FMT"  | sed "s;KEY;$ln;" | sed "s;VALUE;$RESULT;" | bash
      else
        echo "$NO_RESULT_FMT"  | sed "s;KEY;$ln;" | sed "s;VALUE;$RESULT;" | bash
      fi
    done
  echo "$END_MSG" | sed "s;@;$FILE;" | bash
}

if [ -p /dev/stdin ]; then
  cat - | normalize_json "$@"
else
  normalize_json "$@"
fi
