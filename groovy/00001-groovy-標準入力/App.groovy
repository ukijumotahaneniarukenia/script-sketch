#!/usr/bin/env groovy

def output (BufferedReader stream) {
    String line
    while((line = stream.readLine()) != null) {
        println line
    }
}

def usage(){
    String usage = """
Usage:

IN: a.txt b.txt

CMD: echo a.txt b.txt | App.groovy

OUT:

or

IN: seq 10 | xargs -n2

CMD: seq 10 | xargs -n2 | App.groovy

OUT:

"""
}

if (args.length > 0) {
    //コマンドライン引数がある場合
    args.each { String fileName ->
        File file = new File(fileName)
        if(!file.exists()){
            //ファイルが存在しない場合
            usage()
        }
        def stream = new File(fileName).newReader()
        output(stream)
    }
} else {
    //コマンドライン引数がない場合
    def stdin = new BufferedReader(new InputStreamReader(System.in))
    output(stdin)
}
