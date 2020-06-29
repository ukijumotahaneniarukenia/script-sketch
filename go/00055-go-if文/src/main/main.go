package main

//https://go-tour-jp.appspot.com/flowcontrol/6

import (
	"fmt"
	"math"
)

func pow(x, n, lim float64) float64 {

	// 閾値を超えていないなら、計算値を返却

	// 条件節にある式を評価できる 特有

	if v := math.Pow(x, n); v < lim {
		return v
	}

	// 閾値を超えたら、上限値を返却
	return lim
}

func pow2(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	} else {
		//return文は書かなくても行ける 警告はでるが
		fmt.Printf("%g >= %g\n", v, lim)
	}
	// if スコープを抜けるとif条件節の変数は見えない
	return lim
}

func main() {
	fmt.Println(
		pow(3, 2, 10), //9
		pow(3, 3, 20), //20
	)

	fmt.Println(
		pow2(3, 2, 10), //9
		pow2(3, 3, 20), //20
	)
}
