import os

proc main(args: seq[string]): int =
  echo typeof(stdin.lines) #TaintedString
  for line in stdin.lines:
    echo line
    echo typeof(line) #TaintedString
    echo typeof(stdin) #File
  return 0

when isMainModule:
  let args = commandLineParams()
  echo typeof(args) #seq[TaintedString]
  quit main(args)
