package main

import (
	"log"
	"os"
)

func main() {
	fp, err := os.Open("main.go")
	if err != nil {
		log.Fatal(err)
	}
	defer fp.Close()
}
