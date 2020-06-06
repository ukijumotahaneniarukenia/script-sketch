package sample

fun main() {
    val m1 = mapOf("one" to 1, "two" to 2, "three" to 3)

    println(m1 + Pair("four", 4))//Pairコンストラクタでマップのエントリを作成することができる

    println(m1 + Pair("one", 10))//Pairコンストラクタでマップのエントリを作成することができる

    println(m1 + mapOf("five" to 5, "one" to 11))

    val m2 = mutableMapOf(
        Pair(1, listOf("apple",100))
        ,Pair(2, listOf("banana",200))
        ,Pair(3, listOf("kiwii",300))
        ,Pair(3, listOf("orange",400))
    )

    for((k,v) in m2){

        println("$k\t$v")
    }

    m2 += mutableMapOf(Pair(1, listOf("20191009")))

    for((k,v) in m2){

        println("$k\t$v")
    }

    val m3 = mutableMapOf(
        Pair(1, listOf("apple",100))
        ,Pair(2, listOf("banana",200))
        ,Pair(3, listOf("kiwii",300))
        ,Pair(3, listOf("orange",400))
    )

}