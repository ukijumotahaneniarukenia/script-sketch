package sample


//https://kotlinlang.org/docs/reference/collection-grouping.html
fun main() {

    //const
    val separator = "\t"

    val s = listOf("c","a","f","e","l","a","t","t","e")

    println(s.groupBy { e->e })

    println(s.groupingBy { e->e }.eachCount())

    println(s)


    s.groupingBy { e->e }.eachCount().forEach { println(it.key+separator+it.value) }



    

}