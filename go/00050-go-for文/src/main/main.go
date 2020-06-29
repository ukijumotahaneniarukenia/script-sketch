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
		fmt.Println(sum2)
		sum2 += sum2
	}
	fmt.Println(sum2)

}
