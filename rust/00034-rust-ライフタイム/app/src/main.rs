fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/lifetimes.html#lifetimes-1

    // let r; // Introduce reference: `r`.
    // {
    //     let i = 1; // Introduce scoped value: `i`.
    //     r = &i; // Store reference of `i` in `r`. // borrowed value does not live long enough
    // } // `i` goes out of scope and is dropped.

    // println!("{}", r); // `r

    // let r; // Introduce reference: `r`.
    // {
    //     let i: u32 = 1; // Introduce scoped value: `i`.
    //     r = i; // Store reference of `i` in `r`. // borrowed value does not live long enough
    // } // `i` goes out of scope and is dropped.

    // println!("{}", r); // `r

}
