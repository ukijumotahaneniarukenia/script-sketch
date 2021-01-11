fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/primitive-types.html#arrays
    let a: [i32; 3] = [1, 2, 3]; // a: [i32; 3]
    println!("{:?}", a);
    let mut m: [i32; 3] = [1, 2, 3]; // m: [i32; 3]
    println!("{:?}", m);
    m[1] = 11;
    m[2] = 22;
    println!("{:?}", m);
    // https://doc.rust-lang.org/1.30.0/std/primitive.array.html
    for x in &m {
        println!("{:?}", x);
    }

    for x in m.iter() {
        println!("{:?}", x);
    }

    let a_a: [i32; 20] = [0; 20]; // a_a: [i32; 20]
    println!("{:?}", a_a); // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    println!("{:?}", a_a.len()); // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    let names: [&str; 3] = ["Graydon", "Brian", "Niko"]; // names: [&str; 3]

    println!("The second name is: {}", names[1]);
}
