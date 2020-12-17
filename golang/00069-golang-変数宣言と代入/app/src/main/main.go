package main

// https://golang.hateblo.jp/entry/golang-variable-constant-define-assign

func main() {

	var integer int = 100

	println(integer) // 100

	// 型名は省略可能
	var number = 200
	println(number) // 200

	// varも省略可能。 = の前に : をつける
	numeric := 300
	println(numeric) // 300

	x, y := 100, 200 //多重代入
	println(x, y)    // 100, 200

	const NUM = 100
	println(NUM) // 100
}
