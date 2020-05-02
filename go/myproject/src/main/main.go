package main
import (
    "fmt"
    "github.com/ukijumotahaneniarukenia/go-repo/gosample"
    "github.com/ukijumotahaneniarukenia/go-repo/test"
)

func main() {
    //定数呼び出し 先頭大文字で外部宣言機能を参照できる
    fmt.Println(gosample.Message)
    //メソッド呼び出し 先頭大文字で外部宣言機能を参照できる
    test.Nnn()
}
