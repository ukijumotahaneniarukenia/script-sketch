package main

// 部分適用とカリー化
// https://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%AA%E3%83%BC%E5%8C%96
func currrrrrrrry(x int) func(int) int {
	return func(y int) int {
		return x * y
	}
}

func main() {
	// 初回ですべての実引数をアタッチさせてもOK
	a := currrrrrrrry(3)(4)
	println(a) // 12

	// 適用する実引数の数が減っていく
	g := currrrrrrrry(10)

	// 適用する実引数の数が減っていく
	a = g(10)
	println(a) // 100

	// 適用する実引数の数が減っていく
	a = g(20)
	println(a) // 200
}
