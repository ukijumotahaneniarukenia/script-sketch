import os

proc main(args: seq[string]): int =
  stdout.writeLine(args[0])
  stdout.writeLine(args[1])
  stdout.writeLine(args[2])
  return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
