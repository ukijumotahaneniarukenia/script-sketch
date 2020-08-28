open System
open System.Text

let s = "元気もりもり森鴎外"


Console.WriteLine(s.GetType().FullName) //System.String


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


//引数ありの戻り値なしの関数定義
let func2 (x : string)=
    for i=0  to x.Length-1 do
        printfn "%d : %c" i x.[i]




let s1 = "𝐂𝚂𝐏𝕣𝙕𝟕𝞁𝐆𝕟𝙝"

printf "%d\n" s1.Length //20

func2(s1)


// 0 : �
// �1� : 𝐂
// 2 : �
// �3� : 𝚂
// 4 : �
// �5� : 𝐏
// 6 : �
// �7� : 𝕣
// 8 : �
// �9� : 𝙕
// 10 : �
// �11� : 𝟕
// 12 : �
// �13� : 𝞁
// 14 : �
// �15� : 𝐆
// 16 : �
// �17� : 𝕟
// 18 : �
// �19� : 𝙝

let rune = new Rune(s1);
