package main

import (
	"fmt"

	"golang.org/x/text/width"
)

func main() {
	text := "123XYZ"
	fmt.Println("半角:", text)
	fmt.Println("全角:", width.Widen.String(text))
}
