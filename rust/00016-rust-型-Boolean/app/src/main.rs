fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/primitive-types.html#primitive-types

    let x = true;

    println!("{:?}", x);

    let y: bool = false;

    println!("{:?}", y);

    let mut z: bool = false;

    println!("before:{:?}", z);

    z = true;

    println!("after:{:?}", z);

}
