import os

proc main(args: seq[string]): int =
  if args.len < 1:
    stdout.writeLine("unko")
    return 1
  else:
    stdout.writeLine("unkojanai")
    return 0

when isMainModule:
  let args = commandLineParams()
  stdout.writeLine(args)
  quit main(args)
