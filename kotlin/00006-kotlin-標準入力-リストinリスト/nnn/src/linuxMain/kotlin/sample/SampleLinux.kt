package sample

import platform.posix.EXIT_SUCCESS
import platform.posix.exit

fun usage(){
    println(
        "Usage:" +
                "\n"+
                "IN:" +
                "\n"+
                "OUT:"+
                "\n"
    )
    exit(EXIT_SUCCESS)
}

fun main(args: Array<String>){
    var list: MutableList<MutableList<String>> = mutableListOf(mutableListOf())
    if(args.isEmpty()){
        var line : String?
        do {
            line = readLine()
            if (line == null){
                break
            }
            list.add(line.split(" ").toMutableList())
        } while (true)
    }else{
        usage()
    }
    println(list.filter { e->e.size!=0})
}