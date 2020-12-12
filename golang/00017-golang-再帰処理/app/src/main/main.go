package main

import (
	"fmt"
)

func recurse(n int, maxLimit int) {

	if n >= maxLimit {
		return
	}

	println(n)

	recurse(n+1, maxLimit)
}

func fact(n int) int {
	if n == 0 {
		return 1
	}
	return n * fact(n-1)
}

func main() {
	fmt.Println(fact(7)) // 5040

	recurse(0, 14)

	// 0
	// 1
	// 2
	// 3
	// 4
	// 5
	// 6
	// 7
	// 8
	// 9
	// 10
	// 11
	// 12
	// 13

}
