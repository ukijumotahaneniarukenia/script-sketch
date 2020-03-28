package main
import (
    "fmt"
    "gosample"
    "data"
)


func mmm (a int,b int) int{ //先頭文字が小文字は同一パッケージ内の別ファイルからも参照できる
  return a+b
}

func main() {
    var e data.Mydata
    e.Num =100
    e.Str ="kkk"
    fmt.Printf("e.num=%d,e.str=%s\n",e.Num,e.Str)
    fmt.Println(gosample.Message)
    fmt.Println(gosample.NNN)
    rt :=mmm(10,20)
    fmt.Println(rt)
    rtt :=gosample.Mmm(1,2)
    fmt.Println(rtt)
}
