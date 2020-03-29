import os
import strutils
import sequtils

proc main(args: seq[string]): int =
  if args.len == 0:
    for line in stdin.lines:
      echo line
    return 0
  else:
    stdout.writeLine(args[0])
    stdout.writeLine(args[1])
    stdout.writeLine(args[2])
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
