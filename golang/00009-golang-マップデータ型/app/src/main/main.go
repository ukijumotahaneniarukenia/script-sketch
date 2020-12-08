package main

import "fmt"

func main() {

	m := make(map[string]int)

	fmt.Println("map:", m) // map: map[]

	m["k1"] = 7
	m["k2"] = 13

	fmt.Println("map:", m) // map: map[k1:7 k2:13]

	v1 := m["k1"]

	fmt.Println("v1: ", v1) //v1:  7

	fmt.Println("map:", m) // map: map[k1:7 k2:13]

	fmt.Println("len:", len(m)) //エントリ数 len: 2

	delete(m, "k2")        //指定したキーに紐づくエントリを削除
	fmt.Println("map:", m) // map: map[k1:7]

	_, prs := m["k2"]        //指定したキーに紐づくエントリが存在しているかチェック
	fmt.Println("prs:", prs) // prs: false

	_, prss := m["k1"]        //指定したキーに紐づくエントリが存在しているかチェック
	fmt.Println("prs:", prss) // prs: true

	n := map[string]int{"foo": 1, "bar": 2} //初期化コンストラクタ
	fmt.Println("map:", n)                  // map: map[bar:2 foo:1]

	type Vertex struct {
		Lat, Long float64
	}

	var vertexMap map[string]Vertex

	vertexMap = make(map[string]Vertex)
	vertexMap["Bell Labs"] = Vertex{
		40.68433, -74.39967,
	}
	fmt.Println(vertexMap["Bell Labs"]) // {40.68433 -74.39967}

	fmt.Println(vertexMap["Bell Labs"].Lat) // 40.68433

	fmt.Println(vertexMap["Bell Labs"].Long) // -74.39967

	// https://tour.golang.org/moretypes/21
	var vertexMap2 = map[string]Vertex{
		"Bell Labs": {
			40.68433, -74.39967,
		},
		"Google": {
			37.42202, -122.08408,
		},
	}

	fmt.Println(vertexMap2)                   // map[Bell Labs:{40.68433 -74.39967} Google:{37.42202 -122.08408}]
	fmt.Println(vertexMap2["Bell Labs"])      // {40.68433 -74.39967}
	fmt.Println(vertexMap2["Bell Labs"].Lat)  // 40.68433
	fmt.Println(vertexMap2["Bell Labs"].Long) // -74.39967
	fmt.Println(vertexMap2["Google"])         // {37.42202 -122.08408}
	fmt.Println(vertexMap2["Google"].Lat)     //
	fmt.Println(vertexMap2["Google"].Long)    //
}
