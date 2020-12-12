package main

func hello() (str string, err error) {

	// ret = [] 的なのり
	// return ret

	str = "うんこ"
	return
}

func main() {
	str, err := hello()
	println(str, err == nil) //うんこ true

	s, e := hello()
	println(s, e == nil) //うんこ true

	ss, ee := hello()
	println(ss, ee != nil) //うんこ false
}
