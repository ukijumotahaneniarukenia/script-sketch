chk_single_row(){
  #単一行チェック
  local CNT=0
  while read ln;do
    [ $(echo $ln | grep -c "0a") -eq 1 ] && CNT=$((CNT + 1))
  done < <(echo "$@" | xxd -ps -c1)
  [ $CNT -gt 1 ] || echo 0
  [ $CNT -gt 1 ] && echo 1
}
