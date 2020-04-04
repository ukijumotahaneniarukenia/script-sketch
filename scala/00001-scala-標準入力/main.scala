import scala.io.StdIn.readLine
import java.util.Scanner //javaのクラスが使える
import scala.collection.mutable.HashMap
import sun.misc.Signal
import sun.misc.SignalHandler

object main {
  def main(args: Array[String]) = {
    //trap(List("INT"))//シグナルキャッチできたらしていきたい
    var rtmap = HashMap[Int,Seq[String]]()
    if(0==args.length){
      //パイプ経由引数の場合
      var stdin=new Scanner(System.in) //型推論 あいまいに受け取れる
      var liz = Seq[String]() //Nimと同じ
      while(stdin.hasNextLine()){
        liz = liz :+ stdin.nextLine()
      }
      rtmap=XXX(liz)
      YYY(rtmap)

      stdin.close()
    }else{
      //コマンドライン経由引数の場合
      var liz = Seq[String]() //Nimと同じ
      liz = args.toList
      if(1==liz.length){
        //改行込みでワンエレメントになっている標準入力への対応
        liz=liz(0).split("\n").toList //初期化し直し
      }else{
        //改行なしでフラットなコマンドライン引数の場合 なにもしないときはなにも書かなくていい。楽。
      }
      rtmap=XXX(liz)
      YYY(rtmap)
    }
  }

  def XXX(liz:Seq[String]) :HashMap[Int,Seq[String]]= {
    var map = HashMap[Int,Seq[String]]()
    Range(0, liz.length).toList.foreach{i=>
      map += (i->liz(i).split(" ").toList)
    }
    return map
  }

  def YYY(maz:HashMap[Int,Seq[String]])= {
    Range(0, maz.size).toList.foreach{i=>
      println(maz(i))
    }
  }

  def trap(liz:List[String])= {
    Range(0, liz.length).toList.foreach{i=>
      catch_sig(liz(i))
    }
  }

  def catch_sig(str:String)={
    var sig = new Signal(str)
  }

  def usage() = {
    var clazzName = new Object(){}.getClass().getEnclosingClass().getName()
    var className = clazzName.slice(0,clazzName.length-1)
    var cmdname = "scala"
    println(className)
    println("\nUsage:\n" +
            "echo うんこ もりもり 森鴎外 | xargs -n1 | xargs -n2 | " + cmdname + " " + className +"\n"+
            cmdname + " " + className + " " + "\"$(echo {1..10}|xargs -n3)\"" +"\n"
    )
    System.exit(0)
  }
}
