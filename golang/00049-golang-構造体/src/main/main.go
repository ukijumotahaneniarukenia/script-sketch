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
	fmt.Println(p)            //&{1 2}
	fmt.Println(v)            //{1 2}
	fmt.Println(Vertex{1, 2}) //{1 2}
	fmt.Println(*p)           //{1 2}

}
