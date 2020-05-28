package main

import (
	"fmt"
)

func main() {
	s := "スペシャル"
	for _, r := range s {
		rr := int(r - '1')
		rrr := int(r + '1')
		fmt.Println(string(r))
		fmt.Println(string(rr))
		fmt.Println(string(rrr))

	}
}
