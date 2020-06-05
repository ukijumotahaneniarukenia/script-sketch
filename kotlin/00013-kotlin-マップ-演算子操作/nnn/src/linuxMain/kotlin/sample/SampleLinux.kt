package sample
fun main() {

    val m1 = mapOf("one" to 1, "two" to 2, "three" to 3)
    println(m1 + Pair("four", 4))
    println(m1 + Pair("one", 10))
    println(m1 + mapOf("five" to 5, "one" to 11))


    val m2 = mapOf("one" to 1, "two" to 2, "three" to 3)
    println(m2 - "one") //キー単一を渡してエントリ削除できる
    println(m2 - listOf("two", "four")) //キーリストを渡してエントリ削除できる

    val m3 = mutableMapOf("one" to 1, "two" to 2)
    m3["three"] = 3 //putと同義 単一エントリ代入
    println(m3)


    val m4 = mutableMapOf("one" to 1, "two" to 2, "three" to 3)
    m4.putAll(setOf("four" to 4, "five" to 5)) //複数エントリ代入
    println(m4)


    //同一のキーの単一上書き
    val m5 = mutableMapOf("one" to 1, "two" to 2)
    val m5Prev = m5.put("one", 11) //単一戻り値は表示できる
    println("value associated with 'one', before: $m5Prev, after: ${m5["one"]}")
    println(m5)

    //同一のキーの複数上書き
    val m6 = mutableMapOf("one" to 1, "two" to 2)
    val m6Prev = m6.putAll(setOf("one" to 4, "two" to 5)) //複数戻り値は表示できる
    println("value associated with 'one', before: $m6Prev, after: ${m6["one"]}, after: ${m6["two"]}")
    println(m5)

    val m7 = mutableMapOf("one" to 1, "two" to 2)
    m7["three"] = 3 // 右記と同義 m7.put("three", 3)
    m7 += mapOf("four" to 4, "five" to 5) //キーがかぶっていれば値は差分更新されている
    println(m7)

    val m8 = mutableMapOf("one" to 1, "two" to 2)
    m8["three"] = 3 // 右記と同義 m7.put("three", 3)
    m8 += mapOf("one" to 4, "two" to 5) //キーがかぶっていれば値は差分更新されている
    println(m8)

    val m9 = mutableMapOf("one" to 1, "two" to 2, "three" to 3)
    m9.remove("one") //キーを指定して削除
    println(m9)
//    m9.remove("three", 4)            //doesn't remove anything
//    println(m9)

    val m10 = mutableMapOf("one" to 1, "two" to 2, "three" to 3, "threeAgain" to 3)
    m10.keys.remove("one")
    println(m10)
    m10.values.remove(3) //末尾の指定した値に紐づくエントリのみ削除される
    println(m10)

    val m11 = mutableMapOf("one" to 1, "two" to 2, "three" to 3)
    m11 -= "two" //指定したキーを削除
    println(m11)
    m11 -= "five" //存在しないキーを削除しようとしても何も削除されるそのまま
    println(m11)
}