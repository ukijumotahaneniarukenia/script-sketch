fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/primitive-types.html#slices
    let a: [u8;5] = [0, 1, 2, 3, 4];
    let complete = &a[..];
    println!("{:?}", complete); // [0, 1, 2, 3, 4]
    let middle = &a[1..4];
    println!("{:?}", middle); // [1, 2, 3]
    let b = &a[2..];
    println!("{:?}", b); // [2, 3, 4]
    let c = &a[..4];
    println!("{:?}", c); // [0, 1, 2, 3]
}
