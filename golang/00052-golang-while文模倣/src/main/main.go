package main

import (
	"fmt"
)

func main() {
	n := 0
	for n < 10 {
		fmt.Printf("n = %d\n", n)
		n++
	}

	k := 10
	for k > 0 {
		fmt.Printf("k = %d\n", k)
		k--
	}
}
