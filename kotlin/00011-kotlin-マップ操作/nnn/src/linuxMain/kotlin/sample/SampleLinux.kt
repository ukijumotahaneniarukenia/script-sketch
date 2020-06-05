package sample

fun main () {
    val numbersMap = mapOf("one" to 1, "two" to 2, "three" to 3)
    println(numbersMap)
    println(numbersMap.keys)
    println(numbersMap.values)


    val map = mutableMapOf<String, Int?>()
    println(map.getOrElse("x") { 1 }) // 1

    map["x"] = 3 //代入
    println(map.getOrElse("x") { 1 }) // 3

    map["x"] = null //nullの場合のデフォルト値
    println(map.getOrElse("x") { 1 }) // 1

    for(k in numbersMap.keys){
        println(numbersMap[k])
    }
    for((k,v) in numbersMap){
        println("$k\t$v")
    }

    val m1 = mapOf("key1" to 1, "key2" to 2, "key3" to 3, "key11" to 11)

    //キー文字列の末尾が1でかつそのキーに紐づく値が10より大きい場合を抽出
    val filteredMap = m1.filter { (key, value) -> key.endsWith("1") && value > 10}


    println(filteredMap)


    val m2 = mapOf("key1" to 1, "key2" to 2, "key3" to 3, "key11" to 11)
    //キーフィルター
    val filteredKeysMap = m2.filterKeys { it.endsWith("1") }
    //バリューフィルター
    val filteredValuesMap = m2.filterValues { it < 10 }

    println(filteredKeysMap)
    println(filteredValuesMap)

}