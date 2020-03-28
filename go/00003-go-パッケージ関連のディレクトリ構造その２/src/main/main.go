package main
import (
    "fmt"
    "gosample"
)


func mmm (a int,b int) int{ //先頭文字が小文字は同一パッケージ内の別ファイルからも参照できる
  return a+b
}

func main() {
    fmt.Println(gosample.Message)
    fmt.Println(gosample.NNN)
    rt :=mmm(10,20)
    fmt.Println(rt)
    rtt :=gosample.Mmm(1,2)
    fmt.Println(rtt)
}
