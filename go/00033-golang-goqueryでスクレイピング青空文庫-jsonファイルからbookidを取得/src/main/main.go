package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
)

//https://mholt.github.io/json-to-go/

// AozoraBookInfoTyp は繰り返しの単一構造体を定義
type AozoraBookInfoTyp struct {
	BookID int    `json:"book_id"`
	Title  string `json:"title"`
}

func main() {
	// JSONファイル読み込み
	bytes, err := ioutil.ReadFile("NNN-ドグラ・マグラ-.json")
	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	// fmt.Println(bytes)

	// JSONデータを構造体へマッピング
	var aozoraBookInfoTypArray []AozoraBookInfoTyp //複数件対応するため、配列で変数定義

	json.Unmarshal(bytes, &aozoraBookInfoTypArray) //バイト配列を配列変数にマッピング

	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	// マッピングデータを表示
	for _, p := range aozoraBookInfoTypArray {
		fmt.Printf("%d : %s\n", p.BookID, p.Title)
	}
}
