package main

import (
	"bufio"
	"fmt"
	"os"
)

const VERSION = "0.0.1"

func readline() string {
	//改行なし文字列のパイプ経由から標準入力の読み込み
	stdin := bufio.NewScanner(os.Stdin) //戻り値を宣言しなくてすむ再代入
	if stdin.Scan() {
		//一行読み込み
		return stdin.Text() //文字列化して返却
	} else {
		return "" // から文字列化
	}
}

func main() {

	// fmt.Println(VERSION)

	// fmt.Println(os.Args) //コマンドライン引数を取得

	// fmt.Println(os.Args[0]) // 0番目はスクリプト名

	// cmdLineArgs := os.Args

	// fmt.Println(cmdLineArgs[1:]) //コマンドライン引数のみ

	// fmt.Println(len(os.Args)) //コマンドライン引数個数を取得

	// var cnt = len(os.Args)

	// switch cnt {
	// case 1:
	// 	fmt.Println("コマンド引数1個")
	// case 2:
	// 	fmt.Println("コマンド引数2個")
	// case 3:
	// 	fmt.Println("コマンド引数3個")
	// default:
	// 	fmt.Println("over four args ")
	// }

	fmt.Println("============================================================================================")

	cmdLineStrings := readline()

	fmt.Println(cmdLineStrings) //コマンドライン引数のみ

	os.Exit(0)
}
