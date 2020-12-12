package main

//https://blog.amedama.jp/entry/2015/10/11/123535

//遅延評価
//https://go-tour-jp.appspot.com/flowcontrol/12
// deferがある文の次のdefer文が現れるまでの間のすべての文が実行され次第、defer文は実行される

import (
	"fmt"
)

func deferGroup() {
	fmt.Println("う")
	fmt.Println("ん")
	fmt.Println("こ")
}

func main() {
	defer fmt.Println("world")

	//main関数が終了次第実行される
	defer deferGroup()

	fmt.Println("hello")

	fmt.Println("counting")

	// おしゃれ
	for i := 0; i < 10; i++ {
		defer fmt.Println(i)
	}

	fmt.Println("done")
}

// hello
// counting
// done
// 9
// 8
// 7
// 6
// 5
// 4
// 3
// 2
// 1
// 0
// う
// ん
// こ
// world
