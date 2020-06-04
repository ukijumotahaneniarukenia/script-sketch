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
    var cnt = 0
    var map: MutableMap<Int,MutableList<String>> = mutableMapOf()

    if(args.isEmpty()){
        var line : String?
        do {
            line = readLine()
            if (line == null){
                break
            }
            map.put(cnt++,line.split(" ").toMutableList()) //後置インクリ
        } while (true)
    }else{
        usage()
    }
    println(map)
}