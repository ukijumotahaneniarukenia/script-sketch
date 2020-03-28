package main

import (
	"fmt"
	"strings"

	"github.com/ikawaha/kagome/tokenizer"
)

func main() {
	t := tokenizer.New()
	tokens := t.Tokenize("寿司が食べたい。") // t.Analyze("寿司が食べたい。", tokenizer.Normal)
	for _, token := range tokens {
		if token.Class == tokenizer.DUMMY {
			// BOS: Begin Of Sentence, EOS: End Of Sentence.
			fmt.Printf("%s\n", token.Surface)
			continue
		}
		features := strings.Join(token.Features(), ",")
		fmt.Printf("%s\t%v\n", token.Surface, features)
	}
}
