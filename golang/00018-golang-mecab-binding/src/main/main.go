package main

import (
	"fmt"
	"strings"

	"github.com/shogo82148/go-mecab" //GOPATHの環境変数をグローバルに設定している方を見ているため、コンパイルエラーぽくでているが問題なく、コンパイル実行ともにできる
)

func toWakatiGramUnicode(str string) []rune {
	//文字列型の一つ rune 基本これ使っておけばよさげ
	tagger, err := mecab.New(map[string]string{"output-format-type": "wakati"})

	if err != nil {
		//例外処理
		panic(err)
	}

	defer tagger.Destroy()
	result, err := tagger.Parse(str)

	if err != nil {
		//例外処理
		panic(err)
	}
	return []rune(strings.Trim(result, "\n"))
}

func toWakatiList(str string) []string {
	//文字列型の一つ rune 基本これ使っておけばよさげ
	tagger, err := mecab.New(map[string]string{"output-format-type": "wakati"})

	if err != nil {
		//例外処理
		panic(err)
	}

	defer tagger.Destroy()
	result, err := tagger.Parse(str)

	if err != nil {
		//例外処理
		panic(err)
	}
	return []string(strings.Split(strings.Trim(result, "\n"), " "))
}

func toYomiGramUnicode(str string) []rune {
	//文字列型の一つ rune 基本これ使っておけばよさげ
	tagger, err := mecab.New(map[string]string{"output-format-type": "yomi"})

	if err != nil {
		//例外処理
		panic(err)
	}

	defer tagger.Destroy()
	result, err := tagger.Parse(str)

	if err != nil {
		//例外処理
		panic(err)
	}
	return []rune(strings.Trim(result, "\n"))
}

func toYomiList(str string) []string {
	//文字列型の一つ rune 基本これ使っておけばよさげ
	tagger, err := mecab.New(map[string]string{"output-format-type": "yomi"})

	if err != nil {
		//例外処理
		panic(err)
	}

	defer tagger.Destroy()
	result, err := tagger.Parse(str)

	if err != nil {
		//例外処理
		panic(err)
	}
	return []string(strings.Split(strings.Trim(result, "\n"), " "))
}

func main() {

	var s = "こんにちは世界"

	// rt_rune := toWakatiGramUnicode(s)

	// fmt.Println(rt_rune)

	// fmt.Println(rt_rune[0])

	rt_non_rune := toWakatiList(s)

	fmt.Println(rt_non_rune)

	fmt.Println(rt_non_rune[0])

	fmt.Println(rt_non_rune[1])

	fmt.Println(rt_non_rune[2]) //なにもでん

	// rt_rune := toYomiGramUnicode(s)

	// fmt.Println(rt_rune)

	// fmt.Println(rt_rune[0])

	// rt_non_rune := toYomiList(s)

	// fmt.Println(rt_non_rune)

	// fmt.Println(rt_non_rune[0])
}
