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

proc debug(t: Table[int, seq[string]]) =
  for k,v in t.pairs:
    echo k,v

proc my_cycle(t: Table[int, seq[string]]) =
  var rt : seq[string]
  for k,v in t.pairs:
    rt = v[(low(v)+1)..high(v)].cycle(v[0].parseInt)
    echo rt

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
    my_cycle(t)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    for i in low(args)..high(args):
      n = n + 1
      a.add(args[i])
      t[1] = a
    my_cycle(t)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
