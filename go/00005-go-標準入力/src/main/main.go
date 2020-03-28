package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {

  scanner := bufio.NewScanner(os.Stdin)

  for scanner.Scan() {
      fmt.Println(scanner.Text())
  }

  err := scanner.Err();

  if err != nil {
    fmt.Fprintln(os.Stderr, "error:", err)
    os.Exit(1)
  }
}
