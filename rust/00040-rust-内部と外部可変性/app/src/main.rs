use std::sync::Arc;

fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/mutability.html#interior-vs-exterior-mutability
    println!("Hello, world!");
    let x = Arc::new(5);

    println!("{}", x); // 5

    let y = x.clone();
    println!("{}", y); // 5
}
