import os
import re

let suffix = ".done"

proc usage() =
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage
  quit 0

func XXX(s:string) :string =
  return s.replacef(re"\d+","うんこ")

proc pre_process(filenames: seq[string]) =
  for filename in filenames:
    if existsFile(filename & suffix) :
      removeFile(filename & suffix)
    else :
      stdout.write

proc my_readWriteFile(filenames: seq[string]) =
  for filename in filenames:
    block:
      let rf : File = open(filename , FileMode.fmRead)
      let wf : File = open(filename & suffix , FileMode.fmWrite)
      defer : #go-langの遅延実行と同じ。try-catchのfinallyと同じ。
        close(wf)
        close(rf)
      while rf.endOfFile == false :
        wf.writeLine(XXX(rf.readLine()))

proc main(args: seq[string]): int =
  var a : seq[string]
  if 0 == len(args) :
    #パイプ経由引数の場合
    for line in stdin.lines:
      a.add(line)
    pre_process(a)
    my_readWriteFile(a)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    for i in low(args)..high(args):
      a.add(args[i])
    pre_process(a)
    my_readWriteFile(a)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
