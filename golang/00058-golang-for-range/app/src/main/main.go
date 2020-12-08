package main

import (
	"fmt"
)

func main() {

	for i, v := range []string{"ポルコ", "まるこ", "ジーナ"} {
		fmt.Println(i, v)
	}

	// 0 ポルコ
	// 1 まるこ
	// 2 ジーナ

	for k, v := range map[string]int{"ポルコ": 100, "まるこ": 200, "ジーナ": 300} {
		fmt.Println(k, v)
	}

	// ポルコ 100
	// まるこ 200
	// ジーナ 300

	// マップ in リスト
	for k, v := range map[string][]string{"ポルコ": {"赤", "黄", "青"}, "まるこ": {"赤", "黄"}, "ジーナ": {"赤"}} {
		fmt.Println(k, v)
	}

	// ポルコ [赤 黄 青]
	// まるこ [赤 黄]
	// ジーナ [赤]

	// マップ in （マップ in リスト）
	for k, v := range map[string]map[string][]string{"1": {"ポルコ": {"赤", "黄", "青"}}, "2": {"まるこ": {"赤", "黄"}}, "3": {"ジーナ": {"赤"}}} {
		fmt.Println(k, v)
	}

	// 1 map[ポルコ:[赤 黄 青]]
	// 2 map[まるこ:[赤 黄]]
	// 3 map[ジーナ:[赤]]

	kurenai := map[string]map[string][]string{"1": {"ポルコ": {"赤", "黄", "青"}}, "2": {"まるこ": {"赤", "黄"}}, "3": {"ジーナ": {"赤"}}}
	for _, v := range kurenai {
		fmt.Println(v)
	}

	// map[ポルコ:[赤 黄 青]]
	// map[まるこ:[赤 黄]]
	// map[ジーナ:[赤]]

	for k, _ := range kurenai {
		fmt.Println(k)
	}

	// 1
	// 2
	// 3

	for k := range kurenai {
		fmt.Println(k)
	}

	// 1
	// 2
	// 3

	fmt.Println(len(kurenai)) // 3
}
