package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

const defaultSeparator = " "

func main() {

	mapInList := make(map[int][]string) // https://stackoverflow.com/questions/12677934/create-a-map-of-string-to-list

	cmdLineArgs := os.Args[1:] //実行ファイル名を除く

	if len(cmdLineArgs) != 0 {
		fmt.Println(cmdLineArgs)
	} else {
		scanner := bufio.NewScanner(os.Stdin)

		i := 0
		for scanner.Scan() {
			i++
			stdInputLine := scanner.Text()

			mapInList[i] = append(strings.Split(stdInputLine, defaultSeparator))

		}

		if err := scanner.Err(); err != nil {
			fmt.Fprintln(os.Stderr, "error:", err)
			os.Exit(1)
		}

		keys := make([]int, 0, len(mapInList)) // 開始インデックス０始まりのソート済みのキーリストを作成しにいく
		for k := range mapInList {
			keys = append(keys, k)
		}
		sort.Ints(keys) // キーの型が string なら sort.Strings とする

		fmt.Println(mapInList)

		for _, k := range keys { //ここはk,_でも、kでもだめ https://gist.github.com/flaviocopes/bed52cc2ac407137b3931bc864b4e31b

			fmt.Println(k, mapInList[k])

		}

	}
}
