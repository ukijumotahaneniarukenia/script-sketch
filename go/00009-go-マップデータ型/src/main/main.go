package main

import "fmt"

func main() {

    m := make(map[string]int)

    fmt.Println("map:", m)

    m["k1"] = 7
    m["k2"] = 13

    fmt.Println("map:", m)

    v1 := m["k1"]
    fmt.Println("v1: ", v1)

    fmt.Println("len:", len(m)) //エントリ数

    delete(m, "k2") //指定したキーに紐づくエントリを削除
    fmt.Println("map:", m)

    _, prs := m["k2"] //指定したキーに紐づくエントリが存在しているかチェック
    fmt.Println("prs:", prs)

    _, prss := m["k1"] //指定したキーに紐づくエントリが存在しているかチェック
    fmt.Println("prs:", prss)

    n := map[string]int{"foo": 1, "bar": 2} //初期化コンストラクタ
    fmt.Println("map:", n)
}
