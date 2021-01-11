fn main() {

    // https://doc.rust-lang.org/1.30.0/book/first-edition/variable-bindings.html#scope-and-shadowing

    let x: i32 = 17;
    {
        let y: i32 = 3;
        println!("The value of x is {} and value of y is {}", x, y);
        // 変数yの寿命はこのブロックスコープまで
    }
    // println!("The value of x is {} and value of y is {}", x, y); // error[E0425]: cannot find value `y` in this scope
}
