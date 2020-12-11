package main

import (
	"fmt"
)

func sum(nums ...int) {
	fmt.Print(nums, " ")
	total := 0
	for _, num := range nums {
		total += num
	}
	fmt.Println(total)
}

func hello(s string, a ...int) {
	fmt.Printf("%s: length: %d, %#v\n", s, len(a), a)
}

func main() {

	sum(1, 2)
	sum(1, 2, 3)

	nums := []int{1, 2, 3, 4}
	sum(nums...)

	hello("ポルコ", 10, 20, 30)

	hello("ポルコ")
}
