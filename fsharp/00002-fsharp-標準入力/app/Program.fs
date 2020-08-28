open System

let a ="aaaaaaaaaaa"

let b =null

match a with
| null -> Console.WriteLine(a + " is null");
| _ -> Console.WriteLine(a + " is not null");

match a with
| null -> printfn "%s is null\n" a 
| _ -> printfn "%s is not null\n" a 

match b with
| null -> Console.WriteLine(b + " is null");
| _ -> Console.WriteLine(b + " is not null");

match b with
| null -> printfn "%s is null\n" b 
| _ -> printfn "%s is not null\n" b 
