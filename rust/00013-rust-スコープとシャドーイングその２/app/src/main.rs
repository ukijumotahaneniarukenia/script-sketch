fn main() {

    // https://doc.rust-lang.org/1.30.0/book/first-edition/variable-bindings.html#scope-and-shadowing

    let x: i32 = 8;
    {
        println!("{}", x); // Prints "8".
        let x = 12;
        println!("{}", x); // Prints "12".
        // 再代入結果はこのブロックスコープまで有効
    }
    println!("{}", x); // Prints "8".
    let x =  42;
    println!("{}", x); // Prints "42".
}
