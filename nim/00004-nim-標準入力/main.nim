import os
import strutils
import sequtils

proc usage() =
  #シグナルキャッチできたらよびたい
  let usage = """
Usage:
IN:
OUT:
"""
  echo usage

proc main(args: seq[string]): int =
  if 0 == len(args) :
    for line in stdin.lines:
      echo line
    return 0
  elif 0<len(args) :
    for i in low(args)..high(args):
      echo args[i]
    return 0
  else :
    usage()
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
