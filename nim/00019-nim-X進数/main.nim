import os
import strutils
import sequtils
import re

proc usage() =
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage
  quit 0

proc debug(s: seq[string]) =
  var dec_ary,bin_ary,oct_ary,hex_ary : seq[string]
  dec_ary = s.mapIt(it)
  bin_ary = s.mapIt(parseBiggestInt(it)).mapIt(toBin(it,32)).mapIt(if it == '0'.repeat(32):"0" else:replacef(it,re"^0+",""))
  oct_ary = s.mapIt(parseBiggestInt(it)).mapIt(toOct(it,32)).mapIt(if it == '0'.repeat(32):"0" else:replacef(it,re"^0+",""))
  hex_ary = s.mapIt(parseBiggestInt(it)).mapIt(toHex(it,32)).mapIt(if it == '0'.repeat(32):"0" else:replacef(it,re"^0+",""))
  for i in 0..len(dec_ary)-1:
    echo dec_ary[i]," ",bin_ary[i]," ",oct_ary[i]," ",hex_ary[i]

proc main(args: seq[string]): int =
  var a : seq[string]
  if 0 == len(args) :
    #パイプ経由引数の場合
    for line in stdin.lines:
      a.add(line)
    debug(a)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    for i in low(args)..high(args):
      a.add(args[i])
    debug(a)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
