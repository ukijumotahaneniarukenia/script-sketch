package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
)

// Person 単一構造体を定義
type Person struct {
	ID       int    `json:"id"`
	Name     string `json:"name"`
	Birthday string `json:"birthday"`
}

func main() {
	// JSONファイル読み込み
	bytes, err := ioutil.ReadFile("vro.json")
	if err != nil {
		log.Fatal(err)
	}
	// JSONデコード
	var persons []Person //複数件対応できるように配列変数定義
	if err := json.Unmarshal(bytes, &persons); err != nil {
		log.Fatal(err)
	}
	// デコードしたデータを表示
	for _, p := range persons {
		fmt.Printf("%d : %s\n", p.ID, p.Name)
	}
}
