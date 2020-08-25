const {argv,stdin} = process

let cmdLineArgs

if(argv[2]){
    //第１要素はnodeの実行バイナリファイルで
    //第２要素はスクリプトのファイル名フルパス
    // console.log(argv.splice(2,argv.length-1).map(ele=>ele.split("\n")).flat().map(row=>row.split(" ")))
    cmdLineArgs = argv.splice(2,argv.length-1).map(ele=>ele.split("\n")).flat().map(row=>row.split(" "))
    console.log(cmdLineArgs)
}else{
    let inputStream

    stdin.setEncoding('utf8')

    //単一行であろうと複数行であろうと単一行になるので、再代入ではなく、代入している
    stdin.on('readable',()=>{
        while(chunk = stdin.read()){
            inputStream = chunk.replace(/\n$/,"").split("\n").map(row=>row.split(" "))
        }
    })

    //lazy sync javascriptのデフォルトは非同期処理だけど、標準入力の終了イベントが発火するまでは標準出力に出力しない
    stdin.on('end',()=>{
        console.log(inputStream)
    })
}
