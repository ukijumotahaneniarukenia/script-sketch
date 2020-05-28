package main


import (
    "fmt"
    go_script "github.com/ukijumotahaneniarukenia/go-repo/go_script"
)

func main() {
    var e go_script.Mydata

    e.Num =100
    e.Str ="kkk"

    fmt.Printf("e.num=%d,e.str=%s\n",e.Num,e.Str)

    fmt.Println(go_script.Message)
    fmt.Println(go_script.NNN)


    go_script.Show_Message()

    rt :=go_script.Mmm(1,2)

    fmt.Println(rt)
}
