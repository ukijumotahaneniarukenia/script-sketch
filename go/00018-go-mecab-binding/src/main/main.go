package main

import (
  "github.com/shogo82148/go-mecab"
  "fmt"
)

func main() {
	tagger, err := mecab.New(map[string]string{"output-format-type": "wakati"})
	defer tagger.Destroy()
	result, err := tagger.Parse("こんにちは世界")
	fmt.Println(result)
	fmt.Println(err)
	fmt.Println("Hello, playground")
}
