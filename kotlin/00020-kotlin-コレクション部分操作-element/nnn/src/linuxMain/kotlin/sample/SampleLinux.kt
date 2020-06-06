package sample

fun main() {
    val l1 = linkedSetOf("one","one", "two", "three", "four", "five")

    //setなので重複排除後のindex位置
    println(l1.elementAt(3)) //指定した位置の要素を取得

    val l2 = listOf("one", "two", "three", "four", "five")

    println(l2.first()) //先頭要素を取得

    println(l2.last()) //末尾要素を取得

    val l3 = listOf("one", "two", "three", "four", "five")

    if(l3.elementAtOrNull(5).isNullOrEmpty()){
        println("nullダヨーン")
        println(l3.elementAtOrNull(5))
    }else{
        println("nullじゃないダヨーン")
    }

    if(l3.elementAtOrNull(3).isNullOrEmpty()){
        println("nullダヨーン")
    }else{
        println(l3.elementAtOrNull(3))
        println("nullじゃないダヨーン")
    }

    println(l3.elementAtOrElse(5) { index -> "The value for index $index is undefined"}) //null値のデフォルト値を設定できる


    val l4 = listOf("one", "two", "three", "four", "five", "six")


    println(l4.first { it.length > 3 }) //先頭から見て条件がtrueになった要素を取得 早期return


    println(l4.last { it.startsWith("f") })//末尾から見て条件がtrueになった要素を取得 早期return



    val l5 = listOf("one", "two", "three", "four", "five", "six")
    println(l5.firstOrNull { it.length > 6 })

    println(l5.lastOrNull  { it.length > 6 })


    val l6 = listOf(1, 2, 3, 4)
    println(l6.find { it % 2 == 0 }) //先頭から2の倍数を取得 早期return
    println(l6.findLast { it % 2 == 0 }) //末尾から2の倍数を取得 早期return

    val l7 = listOf(1, 2, 3, 4)
    println(l7.random())

    val l8 = listOf("one", "two", "three", "four", "five", "six")
    //単一要素の存在チェック
    println(l8.contains("four"))
    println("zero" in l8)

    //複数要素の存在チェック
    println(l8.containsAll(listOf("four", "two"))) //true ともに含まれる場合はtrue
    println(l8.containsAll(listOf("one", "zero"))) //false １つでも含まれない場合はfalse

    val l9 = listOf("one", "two", "three", "four", "five", "six")
    println(l9.isEmpty())
    println(l9.isNotEmpty())

    val empty = emptyList<String>()
    println(empty.isEmpty()) //空のときtrue
    println(empty.isNotEmpty()) //空じゃないのときtrue
}