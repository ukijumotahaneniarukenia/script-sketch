package main

import (
	"fmt"
)

func main() {

	n := 1

	for n <= 100 {

		if n%15 == 0 {
			//１５で割り切れるものをFizzと出力
			fmt.Printf("%s\n", "FizzBuzz")
		} else if n%3 == 0 {
			//３で割り切れるものをFizzと出力
			fmt.Printf("%s\n", "Fizz")
		} else if n%5 == 0 {
			//５で割り切れるものをBazzと出力
			fmt.Printf("%s\n", "Bazz")
		} else {
			//上記以外を数値で出力
			fmt.Printf("%d\n", n)
		}
		n++
	}
}
