package main

import (
	"bufio"
	"fmt"
	"os"
)

const VERSION = "0.0.1"

func readline() string {
	//コマンドライン引数から読み込み
	stdin := bufio.NewScanner(os.Stdin) //戻り値を宣言しなくてすむ代入
	if stdin.Scan() {
		return stdin.Text()
	} else {
		return ""
	}
}

func main() {

	var rdr = bufio.NewReaderSize(os.Stdin, 20)
	rdr.ReadString(10)

	fmt.Println(rdr)

	l, _, _ := rdr.ReadLine()

	fmt.Println(l)
	fmt.Println(string(l))

	fmt.Println(len(l))

	// for {
	// 	if e != nil {
	// 		panic(e)
	// 	}
	// 	if !p {
	// 		break
	// 	}
	// 	fmt.Println(string(l))
	// }

	// fmt.Println(os.Args) //コマンドライン引数を取得

	// fmt.Println(len(os.Args)) //コマンドライン引数個数を取得

	// var line = readline() //再代入じゃない代入 型推論

	// fmt.Println(line)

	// var cnt = len(os.Args) //再代入じゃない代入 型推論

	// switch cnt {
	// case 1:
	// 	fmt.Println("コマンド引数1個")
	// case 2:
	// 	fmt.Println("コマンド引数2個")
	// case 3:
	// 	fmt.Println("コマンド引数3個")
	// default:
	// 	fmt.Println("UNKWON")
	// }

	os.Exit(0)
}
