package sample

fun main() {
    val numbers = (0..13).toList()
    println(numbers.chunked(3)) //先頭から３つずつ分配
    println(numbers.chunked(1)) //先頭から１つずつ分配
    println(numbers.chunked(3) { it.sum() }) //グループごとの合計値を取得
    println(numbers.chunked(3) { it.average() }) //グループごとの平均値を取得
    println(numbers.chunked(3) { it.count() }) //グループごとの件数を取得
    println(numbers.chunked(3) { it.max() }) //グループごとの最大値を取得
    println(numbers.chunked(3) { it.min() }) //グループごとの最小値を取得
}