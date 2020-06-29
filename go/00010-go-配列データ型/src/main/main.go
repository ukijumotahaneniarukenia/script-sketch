package main

import "fmt"

//配列型は固定長

func main() {

	var a [5]int //[n]T 型は、型 T の n 個の変数の配列( array )
	fmt.Println("emp:", a)

	a[4] = 100
	fmt.Println("set:", a)
	fmt.Println("get:", a[4])

	fmt.Println("len:", len(a))

	b := [5]int{1, 2, 3, 4, 5} //[n]T 型は、型 T の n 個の変数の配列( array ) 初期化あり、スタティックイニシャライザ的ななにか
	fmt.Println("dcl:", b)

	var twoD [2][3]int
	for i := 0; i < 2; i++ {
		for j := 0; j < 3; j++ {
			twoD[i][j] = i + j
		}
	}
	fmt.Println("2d: ", twoD)
}
