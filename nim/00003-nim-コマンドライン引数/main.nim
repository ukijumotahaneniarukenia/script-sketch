import os

proc usage() =
  let usage = """
Usage:
   IN:
  OUT:
"""
  echo usage

proc main(args: seq[string]): int =
  if 0 == len(args) :
    usage()
    return 0
  else :
    for i in low(args)..high(args):
      echo args[i]
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
