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

	sum(1, 2)    // [1 2] 3
	sum(1, 2, 3) // [1 2 3] 6

	nums := []int{1, 2, 3, 4}
	sum(nums...) // [1 2 3 4] 10

	hello("ポルコ", 10, 20, 30) // ポルコ: length: 3, []int{10, 20, 30}

	hello("ポルコ") // ポルコ: length: 0, []int(nil)

}
