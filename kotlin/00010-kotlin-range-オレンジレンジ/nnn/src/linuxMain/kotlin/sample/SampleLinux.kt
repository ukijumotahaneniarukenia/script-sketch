package sample

fun main() {

    for(i in 1..10){

        if (i in 1..10 step 2) {
            //奇数
            println(i)
        }else{
            //偶数

        }

    }

    for(j in 1..10){
        if(j in 10 downTo 1 step 2){
            //偶数
            println(j)

        }else{
            //奇数
        }
    }


    var l = 1..10

    for(i in l.filter { it % 3 == 0 }){
        println(i)
    }

}