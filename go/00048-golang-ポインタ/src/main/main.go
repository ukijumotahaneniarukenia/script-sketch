package main

import "fmt"

//https://go-tour-jp.appspot.com/moretypes/1

func main() {

	i, j := 89, 67 //多値を同時に宣言できる

	p := &i //&演算子はそのオペランド( operand )へのポインタを返却

	fmt.Println(p) //0xc00001a070

	fmt.Println(i) //89 直接参照する

	fmt.Println(*p) //89 ポインタ経由で参照する

	*p = 100 //ポインタ経由で値を書き換える

	fmt.Println(p) //0xc0000a6010 元の値も書き換わってしまう

	fmt.Println(i) //100 直接参照する

	fmt.Println(*p) //100 ポインタ経由で参照する

	p = &j //&演算子はそのオペランド( operand )へのポインタを返却

	*p = *p / 37 // ポインタ経由で割り算

	fmt.Println(j) // 1

}
