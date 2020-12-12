package main

// deferがある文の次のdefer文が現れるまでの間のすべての文が実行され次第、defer文は実行される

func f() {
	defer println(3) // return で関数を抜けても最後に実行される

	println(4)

	return

	println(5) // return で関数を抜けるので実行されない
}

func main() {
	println(1)

	defer println(2) // 6の後に実行される

	f()

	f()

	f()

	println(6)

	defer println(100)
	defer println(200)
	defer println(300)
}

// 1
// 4
// 3
// 4
// 3
// 4
// 3
// 6
// 300
// 200
// 100
// 2
