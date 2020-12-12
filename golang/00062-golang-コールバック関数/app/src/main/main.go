package main

func each(a []string, f func(int, string)) {
	for i, v := range a {
		// 引数で渡された関数を実行する
		f(i, v)
	}
}

type Callback func(int, string)

func eachType(a []string, f Callback) {
	for i, v := range a {
		f(i, v)
	}
}

func main() {
	a := []string{"ポルコ", "まるこ", "ジーナ"}
	each(a, func(i int, v string) {
		println(i, v)
		// 0 ポルコ
		// 1 まるこ
		// 2 ジーナ
	})
	eachType(a, func(i int, v string) {
		println(i, v)
		// 0 ポルコ
		// 1 まるこ
		// 2 ジーナ
	})
}
