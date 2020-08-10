//https://github.com/mtynior/ColorizeSwift
import ColorizeSwift

//元ネタ
//https://medium.com/quick-code/lets-build-a-command-line-app-in-swift-328ce274f1cc

//https://stackoverflow.com/questions/24102157/seeking-an-exit-equivalent-in-swift
import Foundation

func usage(){
  let usageMessage = """


  Usage:


    CMD:





  """

  print(usageMessage.yellow())

  exit(0)

}

var cmdLineArgs = CommandLine.arguments
print(cmdLineArgs) //["./.build/x86_64-unknown-linux-gnu/debug/app", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

if CommandLine.arguments.count >= 1 {

  usage()

}else{

   var l : String?

   repeat {

     l = readLine()

     if (l==nil){
       //標準入力からの文字列が空文字列ならない限り、ループ処理
       break
     }

     print(l!)


   }while(true)


}













print("Hello, world!")
