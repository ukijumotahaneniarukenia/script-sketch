package main

import (
	"fmt"

	script "github.com/ukijumotahaneniarukenia/script-go-server/script"
)

func main() {
	var e script.Mydata

	e.Num = 100
	e.Str = "kkk"

	fmt.Printf("e.num=%d,e.str=%s\n", e.Num, e.Str)

	fmt.Println(script.Message)
	fmt.Println(script.NNN)

	script.Show_Message()

	rt := script.Mmm(1, 2)

	fmt.Println(rt)
}
