import os
import re
import sequtils
import strutils

let suffix = ".done"

proc usage() =
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage
  quit 0

proc pre_process(filenames: seq[string]) =
  for filename in filenames:
    if existsFile(filename & suffix) :
      removeFile(filename & suffix)
    else :
      stdout.write

proc my_readfile(filenames: seq[string]) =
  var rt_ary : seq[string]
  for filename in filenames:
    block:
      let rf : File = open(filename , FileMode.fmRead)
      let wf : File = open(filename & suffix , FileMode.fmWrite)
      defer : #go-langの遅延実行と同じ。try-catchのfinallyと同じ。
        close(wf)
        close(rf)
      rt_ary.add(rf.readAll().findAll(re"<script.*?script>")) #要素なしSeqは追加されないことがわかった便利。 #複数行にわたってマッチさせたいので、一括読込。正規表現のところ変数にしたんだよな。
      rt_ary = rt_ary.mapIt(it.replacef(re"<script.*?>(.*)</script>","$1")).filterIt(it != "")
      wf.writeLine("[")
      wf.writeLine(join(rt_ary,","))
      wf.writeLine("]")

proc main(args: seq[string]): int =
  var a : seq[string]
  if 0 == len(args) :
    #パイプ経由引数の場合
    for line in stdin.lines:
      a.add(line)
    pre_process(a)
    my_readfile(a)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    for i in low(args)..high(args):
      a.add(args[i])
    pre_process(a)
    my_readfile(a)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
