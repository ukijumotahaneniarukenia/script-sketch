package main

import (
	"fmt"
)

func main() {

	f := func() {
		println("hello")
	}

	f() // hello

	ff := func(str string) {
		println(str)
	}

	ff("うんこ") // うんこ

	fff := func(s string, a ...int) {
		fmt.Printf("%s: length: %d, %#v\n", s, len(a), a)
	}

	fff("ポルコ", 10, 20, 30) // ポルコ: length: 3, []int{10, 20, 30}
}
