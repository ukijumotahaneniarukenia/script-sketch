package main

import (
  "fmt"
  "os"
)

func main(){
  s:=os.Args
  ss:=os.Args[1:]
  sss:=os.Args[3]
  fmt.Println(s)
  fmt.Println(ss)
  fmt.Println(sss)
}
