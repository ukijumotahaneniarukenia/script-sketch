package main

import (
	"fmt"
	"strings"
)

func main() {
	// s := "UNKO"
	// s := "うんこ"
	// s := "もりもり"
	// s := "森鴎外"
	// s := "ﾓﾘﾓﾘ"
	s := "スペシャル"

	// for i := 0; i < len(s); i++ {
	// 	//１バイト単位で出力
	// 	//１文字単位ではない
	// 	b := s[i]
	// 	fmt.Println(b)

	// 	fmt.Printf("%x\n", s[i])
	// }

	//https://golang.org/pkg/strings/#Repeat
	// fmt.Println(strings.Repeat("=", 80))

	// for _, r := range s {
	// 	fmt.Println(r)
	// }

	//配列に落とし込む

	for _, r := range s {
		rt := int(r - '0')
		fmt.Println(rt)
	}

	fmt.Println(strings.Repeat("=", 80))

	for _, r := range s {
		rt := int(r - '1') //対象文字のコードポイントより一文字前のコードポイントを取得

		fmt.Println(string(r))

		fmt.Println(string(rt))

	}

}
