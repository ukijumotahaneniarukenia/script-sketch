package sample

fun main() {
    val l1 = listOf("one", "two", "three", "four", "five")
    println(l1.windowed(3)) //[[one, two, three], [two, three, four], [three, four, five]]

    val numbers = (1..10).toList()
    println(numbers.windowed(3))//[[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9], [8, 9, 10]]
    println(numbers.windowed(3,step = 1,partialWindows = true))//[[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9], [8, 9, 10], [9, 10], [10]]
    println(numbers.windowed(3, step = 2, partialWindows = true)) //途中の部分集合を出力する //[[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9], [9, 10]]
    println(numbers.windowed(3, step = 2, partialWindows = false)) //途中の部分集合を出力しない //[[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9]]

    println(numbers.windowed(3,step = 3,partialWindows = true)) //[[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

    println(numbers.windowed(3,step = 4,partialWindows = true)) //[[1, 2, 3], [5, 6, 7], [9, 10]]

    println(numbers.windowed(3,step = numbers.size,partialWindows = true)) //[[1, 2, 3]]

    println(numbers.windowed(3) { it.sum() })//[6, 9, 12, 15, 18, 21, 24, 27]
    println(numbers.windowed(3) { it.count() })//
    println(numbers.windowed(3) { it.average() })//
    println(numbers.windowed(3) { it.min() })//
    println(numbers.windowed(3) { it.max() })//
}
