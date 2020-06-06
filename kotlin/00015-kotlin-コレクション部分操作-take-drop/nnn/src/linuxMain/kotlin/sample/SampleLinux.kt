package sample

fun main() {
    val numbers = listOf("one", "two", "three", "four", "five", "six")
    println(numbers.take(3)) //先頭から３要素取得
    println(numbers.takeLast(3)) //末尾から３要素取得
    println(numbers.drop(1)) //先頭から１要素削除
    println(numbers.dropLast(5)) //末尾から５要素削除


    println(numbers.take(3).take(2))


    println(numbers.takeWhile { !it.startsWith('f') }) //単一要素の先頭文字がfでないものを抽出 先頭からパタンマッチした時点で早期リターン
    println(numbers.takeLastWhile { it != "three" }) //単一要素がthreeでないものを抽出 末尾からパタンマッチした時点で早期リターン


    println(numbers.dropWhile { it.length == 3 }) //単一要素の文字列長が3であるものを削除 先頭からパタンマッチした時点で早期リターン
    println(numbers.dropLastWhile { it.contains('i') }) //単一要素にiが含まれているものを削除 末尾からパタンマッチした時点で早期リターン

    val c1 = ('a'..'z').toList()
    println(c1.take(3)) // [a, b, c]
    println(c1.takeWhile { it < 'f' }) // [a, b, c, d, e]
    println(c1.takeLast(2)) // [y, z]
    println(c1.takeLastWhile { it > 'w' }) // [x, y, z]


    val c2 = ('a'..'z').toList()
    println(c2.drop(23)) // [x, y, z]
    println(c2.dropLast(23)) // [a, b, c]
    println(c2.dropWhile { it < 'x' }) // [x, y, z]
    println(c2.dropLastWhile { it > 'c' }) // [a, b, c]
}