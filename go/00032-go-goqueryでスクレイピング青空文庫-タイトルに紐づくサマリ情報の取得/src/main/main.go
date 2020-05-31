package main

import (
	"log"
	"net/url"
	"os"

	"github.com/PuerkitoBio/goquery"
)

const (
	entryPoint = "http://www.aozorahack.net/api/v0.1/books/"
)

func main() {

	//https://github.com/aozorahack/pubserver
	titleName := "ドグラ・マグラ"
	prefix := "NNN"
	suffix := ".txt"
	separator := "-"
	outFileName := prefix + separator + titleName + separator + suffix

	values := url.Values{}
	values.Add("title", titleName)
	url := entryPoint + "?" + values.Encode()

	// fmt.Println(url)
	//Output
	//http://www.aozorahack.net/api/v0.1/books/?title=%E3%83%89%E3%82%B0%E3%83%A9%E3%83%BB%E3%83%9E%E3%82%B0%E3%83%A9

	doc, err := goquery.NewDocument(url)
	if err != nil {
		panic(err)
		os.Exit(1)
	}

	selection := doc.Find("body")
	text := selection.Text()

	// fmt.Println(text)

	// 文字列をファイルへ書き込み
	//https://qiita.com/akkikki_romeo/items/508331ef514da918aa8a
	outFile, err := os.Create(outFileName)
	if err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
	}
	defer outFile.Close()

	outFile.Write(([]byte)(text))

	// fmt.Println("Now On Air")
}
