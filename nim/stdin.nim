import os

proc main(args: seq[string]): int =
  stdout.writeLine(args)
  return 0

when isMainModule:
  let args = commandLineParams()
  stdout.writeLine(args)
  quit main(args)
