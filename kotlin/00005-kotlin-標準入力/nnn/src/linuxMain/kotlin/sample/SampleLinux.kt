package sample

fun usage(){
   print(
       "Usage:" +
               "IN:" +
               "OUT:"+
               "\n"
   )
}

fun main(args: Array<String>){
    var list: MutableList<String> = mutableListOf() //var は再代入可能
    if(args.isEmpty()){
        var line : String?
        do {
            line = readLine()
            if (line == null){
                break
            }
            list.add(line)
        } while (true)
    }else{
        list = args.toMutableList()
    }

    if(list.size==0){
        usage()
    }

    println(list)
}