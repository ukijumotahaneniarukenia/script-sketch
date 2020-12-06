package main

import (
	"fmt"
)

// Vertex struct
type Vertex struct {
	X int
	Y int
}

func main() {
	v := Vertex{1, 2}
	p := &v
	fmt.Println(p)   //&{1 2}
	fmt.Println(p.X) //1
	fmt.Println(p.Y) //2

	fmt.Println(*p) //&{1 2}

	v.Y = 20
	fmt.Println(p.Y) //20
	v.X = 10
	fmt.Println(v.X)          //10
	fmt.Println(v.Y)          //20
	fmt.Println(v)            //{10 20}
	fmt.Println(Vertex{1, 2}) //{1 2}
	fmt.Println(*p)           //{10 20}
	fmt.Println(*&p.X)        //10
	fmt.Println(*&p.Y)        //20
	fmt.Println(p)            //&{10 20}
}
