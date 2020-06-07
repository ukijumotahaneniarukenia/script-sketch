func usage(){
    let usage = """

    Usage:

    IN:

    OUT:

    """
    print(usage)
}

if CommandLine.arguments.count > 1 {
    usage()
} else {
    var l : String?
    repeat{
        l = readLine()
        if (l==nil){
            break
        }
        print(l!)
    }while(true)
}
