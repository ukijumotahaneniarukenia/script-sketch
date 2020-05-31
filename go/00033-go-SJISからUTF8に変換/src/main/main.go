package main

import (
	"bufio"
	"io"
	"log"
	"os"

	"golang.org/x/text/encoding/japanese"
	"golang.org/x/text/transform"
)

func main() {
	// ShiftJISファイルを開く
	sjisFile, err := os.Open("./sjis.txt")
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	defer sjisFile.Close()

	// ShiftJISのデコーダーを噛ませたReaderを作成する
	reader := transform.NewReader(sjisFile, japanese.ShiftJIS.NewDecoder())

	// 書き込み先ファイルを用意
	utf8File, err := os.Create("./utf-8.txt")
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	defer utf8File.Close()

	// 書き込み
	tee := io.TeeReader(reader, utf8File)
	s := bufio.NewScanner(tee)
	for s.Scan() {
	}
	if err := s.Err(); err != nil {
		log.Fatal(err)
		panic(err)
	}
	log.Println("done")
}
