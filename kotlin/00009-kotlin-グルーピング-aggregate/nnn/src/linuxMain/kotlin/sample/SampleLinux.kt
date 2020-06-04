package sample

import kotlin.math.ceil

fun main() {
    val n = listOf(3, 4, 5, 6, 7, 8, 9) //不可変数値リスト

    val a = n.groupingBy{it%3}.aggregate { key, accumulator: StringBuilder?, element, first ->
        if(first){
            //戻り値型はUnit(void)
            //初回のみの設定
            StringBuilder().append(key).append(":").append(element)
        }else{
            //２回目以降の設定
            //戻り値型はUnit(void)
            accumulator!!.append("-").append(element) //!!演算子はaccumulator変数がnullの場合にnull以外の値を返却する 文脈でこの場合は空文字が入るはず。型推論で。
        }
    }

    println(a)

    val b = n.groupingBy{it%3}.aggregate { key, accumulator: Long?, element, first ->
        if(first){
            //戻り値型はUnit(void)
            //初回のみの設定
            0
        }else{
            //２回目以降の設定
            //戻り値型はUnit(void)
            accumulator!!+element //!!演算子はaccumulator変数がnullの場合にnull以外の値を返却する 文脈でこの場合は空文字が入るはず。型推論で。
        }
    }

    println(b)

    val c = n.groupingBy{ ceil((it/3).toDouble())}.aggregate { key, accumulator: StringBuilder?, element, first ->
        if(first){
            //戻り値型はUnit(void)
            //初回のみの設定
            StringBuilder()
        }else{
            //２回目以降の設定
            //戻り値型はUnit(void)
            accumulator!!.append(",").append(element) //!!演算子はaccumulator変数がnullの場合にnull以外の値を返却する 文脈でこの場合は空文字が入るはず。型推論で。
        }
    }

    for((k,v) in c){
        println("${k.toInt()}:$v")
    }

    val d = n.groupingBy{ ceil((it/3).toDouble())}.aggregate { key, accumulator: Long?, element, first ->
        if(first){
            //戻り値型はUnit(void)
            //初回のみの設定
            element.toLong()
        }else{
            //２回目以降の設定
            //戻り値型はUnit(void)
            accumulator!!+element //!!演算子はaccumulator変数がnullの場合にnull以外の値を返却する 文脈でこの場合は空文字が入るはず。型推論で。
        }
    }

    println(d)

}