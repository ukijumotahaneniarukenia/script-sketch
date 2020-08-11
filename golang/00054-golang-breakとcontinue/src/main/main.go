package main

import (
	"fmt"
)

func main() {
	n := 0
	for {
		n++

		//最大値５まで
		if n > 5 {
			// 5より大きくなったら
			break // ループを抜ける
		}
		if n%2 == 0 {
			//偶数なら
			continue // 当該ブロックの処理をスキップして次の繰り返しに移る
		}
		fmt.Println(n) // 奇数のみ表示
	}
}
