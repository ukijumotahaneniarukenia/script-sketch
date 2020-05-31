package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"

	"golang.org/x/text/encoding/japanese"
	"golang.org/x/text/transform"
)

func main() {

	inFileName := "./sjis.txt"
	outFileName := "./utf8.txt"

	//ファイル削除
	_, err := os.Stat(outFileName)
	if err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
	} else {
		if err := os.Remove(outFileName); err != nil {
			fmt.Println(err)
		}
	}

	// ファイルオープン
	inFile, err := os.Open(inFileName)
	if err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
	}
	// ファイル遅延クローズ
	defer inFile.Close()

	// 指定したエンコーディングでファイル読み込み
	reader := transform.NewReader(inFile, japanese.ShiftJIS.NewDecoder())

	// ファイル作成
	outFile, err := os.Create(outFileName)
	if err != nil {
		log.Fatal(err)
		panic(err)
		os.Exit(1)
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
		os.Exit(1)
	}
	log.Println("done")
}
