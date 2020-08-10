package main

//https://blog.amedama.jp/entry/2015/10/11/123535

//遅延評価
//https://go-tour-jp.appspot.com/flowcontrol/12

import (
	"fmt"
)

func deferGroup() {
	fmt.Println("う")
	fmt.Println("ん")
	fmt.Println("こ")
}

func main() {
	//main関数が終了次第実行される
	//defer識別子を付与した関数のうち、先に書いたものがあとで実行される
	defer fmt.Println("world")

	//main関数が終了次第実行される
	defer deferGroup()

	fmt.Println("hello")

	fmt.Println("counting")

	for i := 0; i < 10; i++ {
		defer fmt.Println(i)
	}

	fmt.Println("done")
}
