package main

import (
	"log"
)

// https://qiita.com/ruiu/items/ff98ded599d97cf6646e
func main() {
	defer func() {
		if err := recover(); err != nil {
			log.Fatal(err)
		}
	}()

	panic("ぽるこがパニック") // 2020/12/12 16:25:23 ぽるこがパニック

	panic("マルコがパニック") // 実行されない

	panic("ジーナパニック") // 実行されない
}
