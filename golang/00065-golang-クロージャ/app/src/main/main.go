package main

func increment(n int) func() int {
	// 内部の状態変数nを関数呼び出しごとに持ち回ることができる
	return func() int {
		n++
		return n
	}
}

func main() {
	i := increment(0)

	println(i()) // 1
	println(i()) // 2
	println(i()) // 3
}
