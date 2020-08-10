package main

import (
	"fmt"
	"path/filepath"
)

func main() {

	a := "/home/kuraine/script-sketch/go/00043-go-filepathでパスからファイル名を得る/src/main/main.go"

	fmt.Println(a)

	fmt.Println(filepath.Base(a)) // main.go

}
