package main

//https://go-tour-jp.appspot.com/methods/6

import (
	"fmt"
)

// Vertex 頂点座標
type Vertex struct {
	X, Y float64
}

//dot記法できる Vertex型のインスタンスから呼べる ないしはポインタから呼べる
func (v *Vertex) Scale(f float64) {
	v.X = v.X * f
	v.Y = v.Y * f
}

//dot記法できない 普通の関数 Vertex型のインスタンスを引数に受け取る
func ScaleFunc(v *Vertex, f float64) {
	v.X = v.X * f
	v.Y = v.Y * f
}

func main() {

	v := Vertex{3, 4}

	v.Scale(2)

	fmt.Println(v) //{6 8}

	ScaleFunc(&v, 10) // {60 80}

	fmt.Println(v)

	p := &Vertex{4, 3} //&演算子でポインタを渡す

	fmt.Println(p) //&{4 3}

	p.Scale(3) //

	fmt.Println(p) //&{12 9}

	ScaleFunc(p, 8)

	fmt.Println(v, p) // {60 80} &{96 72}
}
