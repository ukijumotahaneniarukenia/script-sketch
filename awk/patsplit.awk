#!/usr/bin/env gawk

BEGIN {
  #カンマ以外の文字列の0回以上の連続ないしはダブルクヲートで囲まれた文字列をパタンキャッチ
  pat[1] = "([^,]*)|(\"[^\"]+\")"
  for(idx in ARGV){
    if(idx>0){
      n = patsplit(ARGV[idx], cols, pat[1], sep)
      print "n =", n
      for (i = 1; i <= n; i++){
        printf("cols[%d] = <%s>\n", i, cols[i])
      }
    }
  }
}
