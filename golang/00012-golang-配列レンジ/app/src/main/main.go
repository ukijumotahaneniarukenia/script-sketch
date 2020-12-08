package main

import "fmt"

func main() {

	nums := []int{2, 3, 4}
	sum := 0
	for _, num := range nums {
		sum += num
	}
	fmt.Println("sum:", sum) // sum: 9

	for i, num := range nums { //配列に適用
		if num == 3 {
			fmt.Println("index:", i) // index: 1
		}
	}

	kvs := map[string]string{"a": "apple", "b": "banana"}
	for k, v := range kvs { //ハッシュエントリにも適用できる
		fmt.Printf("%s -> %s\n", k, v)
	}
	// b -> banana
	// a -> apple

	for k := range kvs { //キーだけ受け取る
		fmt.Println("key:", k)
	}
	// key: a
	// key: b

	for i, c := range "go" { //文字に適用
		fmt.Println(i, c)
	}
	// 0 103
	// 1 111

	// https://tour.golang.org/moretypes/16
	var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

	for i, v := range pow {
		fmt.Printf("2**%d = %d\n", i, v)
	}
	// 2**0 = 1
	// 2**1 = 2
	// 2**2 = 4
	// 2**3 = 8
	// 2**4 = 16
	// 2**5 = 32
	// 2**6 = 64
	// 2**7 = 128

	// https://tour.golang.org/moretypes/17
	var poww = make([]int, 10)
	for i := range poww {
		poww[i] = 1 << uint(i) // == 2**i
	}
	for _, value := range poww {
		fmt.Printf("%d\n", value)
	}
	// 1
	// 2
	// 4
	// 8
	// 16
	// 32
	// 64
	// 128
	// 256
	// 512

	powww := make([]int, 10)
	for i := range powww {
		powww[i] = 1 << uint(i) // == 2**i
	}
	for _, value := range powww {
		fmt.Printf("%d\n", value)
	}
	// 1
	// 2
	// 4
	// 8
	// 16
	// 32
	// 64
	// 128
	// 256
	// 512

}
