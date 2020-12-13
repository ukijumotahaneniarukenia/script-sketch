import os

proc main(): int =
  for line in stdin.lines:
    echo line
  return 0

when isMainModule:
  quit main()

