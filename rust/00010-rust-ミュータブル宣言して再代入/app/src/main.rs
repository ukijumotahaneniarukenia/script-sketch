fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/variable-bindings.html#mutability

    let x :i32 = 0; // help: if this is intentional, prefix it with an underscore: `_x`

    // x = 10 // cannot assign twice to immutable variable `x`

    let mut y:i32 = 0; // let文単位でスコープが束縛されているので、読み出ししない限り、警告でる

    println!("before: {}", y);

    y = 10;

    println!("after: {}", y);

}
