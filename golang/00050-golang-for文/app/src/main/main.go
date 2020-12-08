package main

import "fmt"

//https://go-tour-jp.appspot.com/flowcontrol/1

func main() {

	sum := 0

	//カッコがいらない

	//初期化ステートメント i:=0;
	//条件式 i < 10;
	//後処理ステートメント i++

	for i := 0; i < 10; i++ {
		sum += i
	}

	fmt.Println(sum)

	//初期化ステートメント 省略できる
	//条件式 i < 10;
	//後処理ステートメント 省略できる

	//前回の蓄積結果から２倍ずつ増える

	sum2 := 1
	//最大値が1000を超えたら、終了
	for sum2 < 1000 {
		sum2 += sum2
	}
	fmt.Println(sum2)

	for i := 0; i < 10; i++ {
		if i%2 == 0 {
			continue
		}
		fmt.Println(i)
	}

	for i := 0; i < 10; i++ {
		if i == 5 {
			break
		}
		fmt.Println(i)
	}

	//初期化ステートメント i, j := 0, 9
	//条件式 i < 10 && j >= 0;
	//後処理ステートメント i, j = i+1, j-1

	// 多重代入

	for i, j := 0, 9; i < 10 && j >= 0; i, j = i+1, j-1 {
		fmt.Println(i, j)
	}

	// ラベルを使ったbreak
loop:
	for i := 0; i < 3; i++ {
		for j := 0; j < 3; j++ {
			if i == 1 && j == 2 {
				break loop
			}
			fmt.Println(i, j)
		}
	}
}
