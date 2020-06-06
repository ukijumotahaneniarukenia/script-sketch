package sample

fun main() {
    val numbers = setOf("one", "two", "three")

    println(numbers union setOf("four", "five")) //和集合 //[one, two, three, four, five]
    println(setOf("four", "five") union numbers) //和集合 //[four, five, one, two, three]

    println(numbers intersect setOf("two", "one")) //共通集合 [one, two]

    println(numbers subtract setOf("three", "four")) //差集合 A-B [one, two]
    println(numbers subtract setOf("four", "three")) //差集合 A-B [one, two]

    println(setOf("four", "three") subtract numbers) //差集合 B-A [four]
    println(setOf("three","four") subtract numbers) //差集合 B-A [four]
 }