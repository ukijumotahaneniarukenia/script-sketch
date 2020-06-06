package sample

fun main() {

    val listA = listOf("a", "b", "c")
    val listB = listOf(1, 2, 3, 4)
    val result = listA.zip(listB) { a, b -> "$a$b" }
    println(result) // [a1, b2, c3]

}