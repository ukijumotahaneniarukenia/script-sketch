package main

import "fmt"

func vals() (int, int) {
	return 3, 7
}

func hello() (string, int, bool) {
	return "hello", 100, true
}

func main() {

	a, b := vals()
	fmt.Println(a) //3
	fmt.Println(b) //7

	_, c := vals()
	fmt.Println(c) //7

	d, _ := vals()
	fmt.Println(d) //3

	s, i, bb := hello()
	fmt.Println(s, i, bb) // hello 100 true

	ss, _, _ := hello() // 必要ない値は _ で破棄できる

	fmt.Println(ss) // hello
}
