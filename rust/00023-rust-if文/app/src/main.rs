fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/if.html

    let x: &str = "うんこ";

    if x == "うんこ" {
        println!("yes {}", x)
    }

    if x == "うんこ" {
        println!("unko {}", x)
    } else {
        println!("unkojanai {}", x)
    }

    let x: &str = "もりもり";

    if x == "うんこ" {
        println!("unko {}", x)
    } else if x == "もりもり" {
        println!("morimori {}", x)
    } else {
        println!("unkomorimorijanai {}", x)
    }

    let x = 5;

    println!("{}", x);
    // case文のように評価結果を代入できる
    let y = if x == 5 { 10 } else { 15 };

    println!("{}", y)
}
