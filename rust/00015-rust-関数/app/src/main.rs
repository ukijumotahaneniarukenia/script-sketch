fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/functions.html#functions
    // https://doc.rust-lang.org/1.30.0/book/first-edition/functions.html#early-returns
    print_number(5);
    print_sum(5, 6);
    println!("{}",foo(99))
}

fn print_number(x: i32) {
    println!("x is: {}", x);
}
fn print_sum(x: i32, y: i32) {
    println!("sum is: {}", x + y);
}
fn foo(x: i32) -> i32 {
    return x + 1;
}


// 関数ポインタ
// let f: fn(i32) -> i32; // error: expected item, found keyword `let`


// fn plus_one(i: i32) -> i32 {
//     i + 1
// }

// // Without type inference:
// let f: fn(i32) -> i32 = plus_one;

// // With type inference:
// let f = plus_one;
