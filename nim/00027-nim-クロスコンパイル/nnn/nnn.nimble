## Package
version       = "0.1.0"
author        = "Anonymous"
description   = "New Nimble project for Nim"
license       = "BSD"

srcDir        = "src"
binDir        = "bin"
bin           = @["nnn"]

## Dependencies
requires "nim"

## Set backend
# backend = "c"

task test, "Run the tester":
  withDir "tests":
    exec "nim c -r tester"
  setCommand "nop"
