import os

proc usage() =
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage
  quit 0

proc my_readfile(filenames: seq[string]) =
  for filename in filenames:
    block:
      let f : File = open(filename , FileMode.fmRead)
      defer : #go-langの遅延実行と同じ。try-catchのfinallyと同じ。
        close(f)
      while f.endOfFile == false :
        echo f.readLine()

proc main(args: seq[string]): int =
  var a : seq[string]
  if 0 == len(args) :
    #パイプ経由引数の場合
    for line in stdin.lines:
      a.add(line)
    my_readfile(a)
    return 0
  elif 0 < len(args) :
    #コマンドライン引数の場合
    for i in low(args)..high(args):
      a.add(args[i])
    my_readfile(a)
    return 0
  else :
    #起動引数がない場合
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
