package main

//https://go-tour-jp.appspot.com/flowcontrol/11

import (
	"fmt"
	"runtime"
	"time"
)

//swith文のコンテキストで条件節を記載しないことで、if-else if -elseを表現できる

//swith trueと解釈する

func switch3() {
	t := time.Now()

	switch {
	case t.Hour() < 12:
		fmt.Println("Good morning!")
	case t.Hour() < 17:
		fmt.Println("Good afternoon.")
	default:
		fmt.Println("Good evening.")
	}
}

func switch2() {
	fmt.Println("When's Saturday?")

	today := time.Now().Weekday()

	//今日土曜日？
	switch time.Saturday {
	case today + 0:
		fmt.Println("そう、今日は土曜日")
	case today + 1:
		fmt.Println("ちがう、明日が土曜日")
	case today + 2:
		fmt.Println("土曜日は２日後ですの")
	default:
		fmt.Println("うんこ")
	}
}

func main() {

	//swith文のコンテキストではbreak文を明示的に記載しなくても処理が終了される

	fmt.Print("Go runs on ")

	switch os := runtime.GOOS; os {
	case "darwin":
		fmt.Println("OS X.")
	case "linux":
		fmt.Println("Linux.")
	default:
		// freebsd, openbsd,
		// plan9, windows...
		fmt.Printf("%s.", os)
	}

	switch2()

	switch3()
}
