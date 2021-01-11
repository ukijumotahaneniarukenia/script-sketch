fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/vectors.html
    let mut v: Vec<i32> = vec![1, 2, 3, 4, 5];

    println!("{:?}", v);
    println!("{:?}", v[3]);

    for i in &v {
        println!("A reference to {}", i);
    }
    for i in &mut v {
        println!("A mutable reference to {}", i);
    }
    for i in v {
        println!("Take ownership of the vector and its element {}", i);
    }

    let vv: Vec<i32> = vec![1, 2, 3, 4, 5];

    // for i in vv {
    //     println!("Take ownership of the vector and its element {}", i);
    // }

    // for i in vv { // error[E0382]: use of moved value: `vv`
    //     println!("Take ownership of the vector and its element {}", i);
    // }

    for i in &vv {
        println!("This is a reference to {}", i);
    }
    for i in &vv {
        println!("This is a reference to {}", i);
    }
}
