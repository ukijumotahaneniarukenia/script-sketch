import os
import strutils
import sequtils
import tables

proc usage() =
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage
  quit 0

proc debug(t: Table[int, seq[string]]) =
  for k,v in t.pairs:
    echo k,v

proc my_conv(t: Table[int, seq[string]]) =
  var n = 0
  for i in 1 .. len(t) :
    n = parseInt(t[i][0]) #指定した折り畳み数
    for j in 1 .. len(t[i])-1:
      if n <= len(t[i][j..len(t[i])-1]):
        #指定した折りたたみ数より残数以上の場合
        echo t[i][j..j+n-1]
      else:
        #指定した折りたたみ数より残数未満の場合
        echo t[i][j..len(t[i])-1]

proc main(args: seq[string]): int =
  var n = 0
  var t = initTable[int, seq[string]]()
  var a : seq[string]
  if 0 == len(args) :
    #パイプ経由引数の場合
    for line in stdin.lines:
      n = n + 1
      a = line.split(" ")
      t[n] = a
    my_conv(t)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    for i in low(args)..high(args):
      n = n + 1
      a.add(args[i])
      t[1] = a
    my_conv(t)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
