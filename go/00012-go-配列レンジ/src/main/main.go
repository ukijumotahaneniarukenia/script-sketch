package main

import "fmt"

func main() {

    nums := []int{2, 3, 4}
    sum := 0
    for _, num := range nums {
        sum += num
    }
    fmt.Println("sum:", sum)

    for i, num := range nums { //配列に適用
        if num == 3 {
            fmt.Println("index:", i)
        }
    }

    kvs := map[string]string{"a": "apple", "b": "banana"}
    for k, v := range kvs { //ハッシュエントリにも適用できる
        fmt.Printf("%s -> %s\n", k, v)
    }

    for k := range kvs { //キーだけ受け取る
        fmt.Println("key:", k)
    }

    for i, c := range "go" { //文字に適用
        fmt.Println(i, c)
    }
}
