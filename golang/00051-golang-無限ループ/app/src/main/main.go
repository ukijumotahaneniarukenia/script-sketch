package main

import (
	"fmt"
)

func main() {

	//https://go-tour-jp.appspot.com/flowcontrol/4

	for i := 0; ; i++ {
		fmt.Printf("%d\n", i)
	}

	for {
		fmt.Print("unko")
	}

}
