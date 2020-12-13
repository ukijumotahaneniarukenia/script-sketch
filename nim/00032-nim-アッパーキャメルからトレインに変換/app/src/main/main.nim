import nre,strutils

proc main(): int =
  for line in stdin.lines:
    # https://nim-lang.org/docs/nre.html#split%2Cstring%2CRegex%2Cint
    echo join(line.split(re"(?=[A-Z])"),"-")
  return 0

when isMainModule:
  quit main()

