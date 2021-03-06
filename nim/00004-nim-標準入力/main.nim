import os
import strutils
import sequtils
import tables

proc usage() =
  #シグナルキャッチできたらよびたい
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage

proc debug(t: Table[int, seq[string]]) =
  for k,v in t.pairs: #エントリキーとエントリ値を同時に取得できる
    echo k,v

proc main(args: seq[string]): int =
  var n = 0
  var t = initTable[int, seq[string]]() #table型の宣言
  var a : seq[string] #seq型配列の宣言
  if 0 == len(args) :
    #パイプ経由引数の場合
    for line in stdin.lines:
      n = n + 1
      a = line.split(" ")
      t[n] = a
    debug(t)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合 #改行単位のグルーピングはむずいから放置 基本パイプからでええやろ
    for i in low(args)..high(args):
      n = n + 1
      a.add(args[i])
      t[1] = a
    debug(t)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
