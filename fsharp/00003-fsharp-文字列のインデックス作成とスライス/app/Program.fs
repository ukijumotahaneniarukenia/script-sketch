open System

let s = "元気もりもり森鴎外"


printfn "%s" s //元気もりもり森鴎外


printfn "%c" s.[0] //元


printfn "%d" s.Length // 9


// printfn "%c" s.[s.Length]
// Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
//    at System.String.get_Chars(Int32 index)
//    at <StartupCode$app>.$Program.main@() in /home/aine/script-sketch/fsharp/00003-fsharp-文字列のインデックス作成とスライス/app/Program.fs:line 13


//https://docs.microsoft.com/ja-jp/dotnet/fsharp/language-reference/exception-handling/the-try-with-expression
try
    printfn "%c" s.[s.Length]
    // Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    //    at System.String.get_Chars(Int32 index)
    //    at <StartupCode$app>.$Program.main@() in /home/aine/script-sketch/fsharp/00003-fsharp-文字列のインデックス作成とスライス/app/Program.fs:line 13
with
    | :? System.IndexOutOfRangeException as ex -> printfn "Exception! %s " (ex.Message);

//unreachable
//トライキャッチしないと到達しない
printfn "%c" s.[s.Length-1] // 外



// nimとかと同じでunitはvoidで戻り値なし
//戻り値なしの関数定義
let func1 ()=
    for i=0  to s.Length-1 do
        printfn "%d : %c" i s.[i]


//戻り値なしの関数呼出
func1()


// 0 : 元
// 1 : 気
// 2 : も
// 3 : り
// 4 : も
// 5 : り
// 6 : 森
// 7 : 鴎
// 8 : 外



