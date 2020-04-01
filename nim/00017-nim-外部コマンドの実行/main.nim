import os
import osproc
import strutils
import sequtils
import tables
import sets
import sugar

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

proc my_XXX(t: Table[int, seq[string]]) =
  var lft_hash,rgt_hash,rt_hash : HashSet[string]
  if 2 != len(t):
    usage()
  else:
    lft_hash = execProcess(t[1].join(" ")).split("\n").filterIt(it != "").toHashSet
    rgt_hash = execProcess(t[2].join(" ")).split("\n").filterIt(it != "").toHashSet

  rt_hash = intersection(lft_hash,rgt_hash)
  echo "lft",":",len(lft_hash)
  echo "rgt",":",len(rgt_hash)
  echo "XXX",":",len(rt_hash)
  echo rt_hash
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
    my_XXX(t)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    usage()
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
