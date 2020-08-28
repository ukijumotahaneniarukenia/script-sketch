open System

let a = [ 1; 2; 3 ] ;;

Console.WriteLine(a);; //[1; 2; 3]


let getNumberInfo(x:int) = (x,x.ToString(),x*x);;


Console.WriteLine(getNumberInfo 42);; //(42, 42, 1764)

Console.WriteLine(getNumberInfo (42));; //(42, 42, 1764)

let tuple = (1,false,"うんこ");;

let swap (x,y) = (y,x);;



Console.WriteLine((1,2));;//(1, 2)

Console.WriteLine(swap(1,2));;//(2, 1)

let b = (1,2);;


Console.WriteLine(b);; //(1, 2)

Console.WriteLine(swap(b));;//(2, 1)



Console.WriteLine(tuple);; //(1, False, うんこ)


Console.WriteLine(tuple.GetType());; //System.Tuple`3[System.Int32,System.Boolean,System.String]

let c = [1..5] //セミコロン省略できる


Console.WriteLine(c) //[1; 2; 3; ... ]


let d = List.map(fun x-> x%2=0) c


Console.WriteLine(d) //[False; True; False; ... ]
