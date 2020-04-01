import os
import osproc
import strutils
import sequtils
import sets
import algorithm

proc usage() =
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage
  quit 0

proc my_intersection(args: seq[string]) =
  var lft_hash,rgt_hash,rt_hash : HashSet[string]
  var rt_ary : seq[string]
  lft_hash = execProcess(args[0]).split("\n").filterIt(it != "").toHashSet
  rgt_hash = execProcess(args[1]).split("\n").filterIt(it != "").toHashSet
  rt_hash = intersection(lft_hash,rgt_hash)
  echo "lft",":",len(lft_hash)
  echo "rgt",":",len(rgt_hash)
  echo "XXX",":",len(rt_hash)
  rt_ary = toSeq(rt_hash) #Set型からSeq型に変換
  rt_ary.sort()
  echo rt_ary

proc my_union(args: seq[string]) =
  var lft_hash,rgt_hash,rt_hash : HashSet[string]
  var rt_ary : seq[string]
  lft_hash = execProcess(args[0]).split("\n").filterIt(it != "").toHashSet
  rgt_hash = execProcess(args[1]).split("\n").filterIt(it != "").toHashSet
  rt_hash = union(lft_hash,rgt_hash)
  echo "lft",":",len(lft_hash)
  echo "rgt",":",len(rgt_hash)
  echo "XXX",":",len(rt_hash)
  rt_ary = toSeq(rt_hash) #Set型からSeq型に変換
  rt_ary.sort()
  echo rt_ary

proc my_difference(args: seq[string]) =
  var lft_hash,rgt_hash,rt_hash : HashSet[string]
  var rt_ary : seq[string]
  lft_hash = execProcess(args[0]).split("\n").filterIt(it != "").toHashSet
  rgt_hash = execProcess(args[1]).split("\n").filterIt(it != "").toHashSet
  rt_hash = difference(lft_hash,rgt_hash)
  echo "lft",":",len(lft_hash)
  echo "rgt",":",len(rgt_hash)
  echo "XXX",":",len(rt_hash)
  rt_ary = toSeq(rt_hash) #Set型からSeq型に変換
  rt_ary.sort()
  echo rt_ary

proc my_symmetricDifference(args: seq[string]) =
  var lft_hash,rgt_hash,rt_hash : HashSet[string]
  var rt_ary : seq[string]
  lft_hash = execProcess(args[0]).split("\n").filterIt(it != "").toHashSet
  rgt_hash = execProcess(args[1]).split("\n").filterIt(it != "").toHashSet
  rt_hash = symmetricDifference(lft_hash,rgt_hash)
  echo "lft",":",len(lft_hash)
  echo "rgt",":",len(rgt_hash)
  echo "XXX",":",len(rt_hash)
  rt_ary = toSeq(rt_hash) #Set型からSeq型に変換
  rt_ary.sort()
  echo rt_ary

proc main(args: seq[string]): int =
  if 0 == len(args) :
    #パイプ経由引数の場合
    usage()
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    if 1 == parseInt(args[0]) :
      my_intersection(args[1..len(args)-1])
    elif 2 == parseInt(args[0]) :
      my_union(args[1..len(args)-1])
    elif 3 == parseInt(args[0]) :
      my_difference(args[1..len(args)-1])
    elif 4 == parseInt(args[0]) :
      my_symmetricDifference(args[1..len(args)-1])
    else :
      usage()
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
