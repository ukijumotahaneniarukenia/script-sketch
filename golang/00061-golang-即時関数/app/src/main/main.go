package main

func main() {
	s := func(n int) int {
		return n * 2
	}(10)

	println(s) // 20

	defer func() {
		if err := recover(); err != nil {
			println(err.(string)) // panicking!
		}
	}()

	panic("panicking!")
}
