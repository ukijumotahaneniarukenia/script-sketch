package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
)

// Person 単一構造体を定義 https://mholt.github.io/json-to-go/
type Person struct {
	ID        int    `json:"id"`
	Name      string `json:"name"`
	Birthday  string `json:"birthday"`
	VividInfo struct {
		Color  string `json:"color"`
		Weapon string `json:"weapon"`
	} `json:"vivid_info"`
}

func main() {
	// JSONファイル読み込み
	bytes, err := ioutil.ReadFile("../test.json")
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
		fmt.Printf("%d : %s : %s : %s : %s\n", p.ID, p.Name, p.Birthday, p.VividInfo.Color, p.VividInfo.Weapon)
	}
}
