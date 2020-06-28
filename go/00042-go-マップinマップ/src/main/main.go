package main

import (
	"fmt"
)

func main() {
	m := map[string]map[string]int{
		"00001": {"key": 10, "value": 20},
		"00002": {"key": 30, "value": 40},
		"00003": {"key": 50, "value": 60},
	}

	fmt.Println(m["00001"]["key"]) // 10

	fmt.Println(m["00001"]) // map[key:10 value:20]

	fmt.Println(m["00002"]) // map[key:30 value:40]

	fmt.Println(m["00003"]) // map[key:50 value:60]

}
