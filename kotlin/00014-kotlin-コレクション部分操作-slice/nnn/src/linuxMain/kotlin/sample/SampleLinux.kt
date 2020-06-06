package sample

fun main() {
    val l1 = listOf("one", "two", "three", "four", "five", "six")
    println(l1.slice(1..3)) //指定したインデックス位置に存在する要素を指定した順で取得
    println(l1.slice(0..4 step 2)) //指定したインデックス位置に存在する指定した順で要素を取得
    println(l1.slice(setOf(3, 5, 0))) //指定したインデックス位置に存在する要素を指定した順で取得

    l1.slice(setOf(9))//Uncaught Kotlin exception: kotlin.ArrayIndexOutOfBoundsException

    println(l1.slice(setOf(3, 5, 0))) //実行されない
}