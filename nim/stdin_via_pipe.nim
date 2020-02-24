import os

proc main(args: seq[string]): int =
  if args.len == 0:
    let s = readLine(stdin)
    stdout.writeLine(s)
    return 0
  else:
    stdout.writeLine(args)
    return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
