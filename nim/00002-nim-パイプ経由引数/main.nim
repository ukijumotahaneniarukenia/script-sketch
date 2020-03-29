import os

proc main(args: seq[string]): int =
  for line in stdin.lines:
    echo line
  return 0

when isMainModule:
  let args = commandLineParams()
  quit main(args)
