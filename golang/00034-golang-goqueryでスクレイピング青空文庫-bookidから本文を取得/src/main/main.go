package main

import (
	"bufio"
	"io"
	"log"
	"os"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"golang.org/x/text/encoding/japanese"
	"golang.org/x/text/transform"
)

const (
	entryPointPrefix = "http://pubserver2.herokuapp.com/api/v0.1/books/"
	entryPointSuffix = "/content?format=txt"
)

func main() {

	//https://github.com/aozorahack/pubserver
	titleName := "ドグラ・マグラ"
	prefix := "NNN"
	suffix := ".txt"
	separator := "-"
	outFileName := prefix + separator + titleName + separator + suffix

	bookID := "2093"
	url := entryPointPrefix + bookID + entryPointSuffix

	// fmt.Println(url)
	//Output
	//http://www.aozorahack.net/api/v0.1/books/?title=%E3%83%89%E3%82%B0%E3%83%A9%E3%83%BB%E3%83%9E%E3%82%B0%E3%83%A9

	doc, err := goquery.NewDocument(url)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	selection := doc.Find("body")
	text := selection.Text()

	// 指定したエンコーディングでファイル読み込み
	reader := transform.NewReader(strings.NewReader(text), japanese.ShiftJIS.NewDecoder())

	// ファイル作成
	outFile, err := os.Create(outFileName)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	// ファイル遅延クローズ
	defer outFile.Close()

	// ファイル書き込み
	tee := io.TeeReader(reader, outFile)
	s := bufio.NewScanner(tee)
	for s.Scan() {
		//バッファーからスキャンできなくなるまでfor文回さないと、書き込まれない
	}
	if err := s.Err(); err != nil {
		log.Fatal(err)
		panic(err)
	}
}
