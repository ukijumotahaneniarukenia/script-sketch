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
	// ファイルオープン
	sjisFile, err := os.Open("./sjis.txt")
	if err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
	}
	// ファイル遅延クローズ
	defer sjisFile.Close()

	// 指定したエンコーディングでファイル読み込み
	reader := transform.NewReader(sjisFile, japanese.ShiftJIS.NewDecoder())

	// ファイル作成
	utf8File, err := os.Create("./utf8.txt")
	if err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
	}
	// ファイル遅延クローズ
	defer utf8File.Close()

	// ファイル書き込み
	tee := io.TeeReader(reader, utf8File)
	s := bufio.NewScanner(tee)
	for s.Scan() {
		//バッファーからスキャンできなくなるまでfor文回さないと、書き込まれない
	}
	if err := s.Err(); err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
	}
	log.Println("done")
}
