#!/usr/bin/env groovy

def output (BufferedReader stream) {
    String line
    while((line = stream.readLine()) != null) {
        combinations(line.split(" ").toList())
    }
}

def combinations(List<String> list){
    int num = list.first().toInteger()

    List<String> l2 = new ArrayList<>(Arrays.asList(list[1..list.size()-1])).flatten()

    List<String> l = (l2.join("\t")+"\n").repeat(l2.size()).replaceFirst("\t\$","").split("\n").toList()

    List<List<String>> ll = new ArrayList<>()

    l.each { e ->
        ll.add(e.split("\t").toList())
    }

    List<List<String>> combinations = new ArrayList<>()

    ll.take(ll.size() < num ? ll.size() : num).combinations {
        //ここがなんで文字列になってしまうんか
        combinations.add("${it}".replaceFirst("]\$","").replaceFirst("^\\[","").replaceAll(" +","").split(",").toList())
    }

    List<List<String>> result = new ArrayList<>()

    for(int i=0;i<combinations.size();i++){
        if(combinations.get(i).sort().unique().size() == num){
            result.add(combinations.get(i).sort().unique())
        }
    }

    result.unique().each {
        println "${it}".replaceFirst("]\$","").replaceFirst("^\\[","").replaceAll(", ","\t")
    }
}

def usage(){
    String usage = """
Usage:

IN:

echo 2 ポルコ サボイア ジーナ | ./App.groovy

OUT:

サボイア	ポルコ
ジーナ	ポルコ
サボイア	ジーナ

or

IN:

echo 2 {A..D} | ./App.groovy


OUT:

A	B
A	C
A	D
B	C
B	D
C	D


"""
    println(usage)
}

if (args.length > 0) {
    //コマンドライン引数がある場合
    usage()
} else {
    //コマンドライン引数がない場合
    def stdin = new BufferedReader(new InputStreamReader(System.in))
    output(stdin)
}
