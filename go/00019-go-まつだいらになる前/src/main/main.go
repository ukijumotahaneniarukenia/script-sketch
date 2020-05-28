package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

const VERSION = "0.0.1"

const DEFAULT_SEPARATOR = " "

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

	fmt.Println(VERSION)

	fmt.Println(os.Args) //コマンドライン引数を取得

	fmt.Println(os.Args[0]) // 0番目はスクリプト名

	cmdLineArgs := os.Args //宣言なし再代入

	fmt.Println(cmdLineArgs[1:]) //コマンドライン引数のみ

	fmt.Println(len(os.Args)) //コマンドライン引数個数を取得

	var cnt = len(os.Args)

	switch cnt {
	case 1:
		fmt.Println("コマンド引数1個")
	case 2:
		fmt.Println("コマンド引数2個")
	case 3:
		fmt.Println("コマンド引数3個")
	default:
		fmt.Println("over four args ")

	}

	os.Exit(0)

	fmt.Println("============================================================================================")

	cmdLineStrings := readline() //宣言なし再代入

	fmt.Println(cmdLineStrings) //コマンドライン引数のみ

	nnn := strings.Split(cmdLineStrings, DEFAULT_SEPARATOR) //宣言なし再代入

	fmt.Println(nnn)

	fmt.Println(len(nnn))

	mx := len(nnn) //宣言なし再代入

	for i := 0; i < mx; i++ {
		fmt.Println(nnn[i])
	}

	os.Exit(0)
}
