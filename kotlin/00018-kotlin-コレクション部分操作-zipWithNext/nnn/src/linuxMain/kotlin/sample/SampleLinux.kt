package sample
fun main() {
    val numbers = listOf("one", "two", "three", "four", "five")
    println(numbers.zipWithNext()) //[(one, two), (two, three), (three, four), (four, five)]
    println(numbers.zipWithNext() { s1, s2 -> s1.length > s2.length}) //[false, false, true, false] //各ペアごとに左の文字列長が右の文字列長よりも大きい場合

    var rt = numbers.zipWithNext() { s1, s2 -> s1.length > s2.length}

    println(rt)


    val letters = ('a'..'f').toList()
    val pairs = letters.zipWithNext() //ペア生成に便利

    println(letters) // [a, b, c, d, e, f]
    println(pairs) // [(a, b), (b, c), (c, d), (d, e), (e, f)


    val values = listOf(1, 4, 9, 16, 25, 36)
    val deltas = values.zipWithNext { a, b -> b - a } //トランスフォームする際の戻り値は任意

    println(deltas) // [3, 5, 7, 9, 11]
}