fn main() {
    let x = (1, "hello");

    println!("{:?}", x); // (1, "hello")

    let x: (i32, &str) = (11, "うんこ");

    println!("{:?}", x); // (11, "うんこ")

    let mut x: (i32, i32) = (1, 2); // x: (i32, i32)

    println!("{:?}", x);

    let y: (i32, i32) = (2, 3); // y: (i32, i32)

    println!("{:?}", y);
    x = y;

    println!("{:?}", x);

    let (x, y, z): (i32, i32, i32) = (1, 2, 3);

    println!("x is {}", x);
    println!("x is {} ,y is {},z is {}", x, y, z);

    let unko = (0,); // A single-element tuple.
    println!("{:?}", unko); //(0,)
    let unko = (0); // A zero in parentheses. // warning: unnecessary parentheses around assigned value

    let unko = 0;

    println!("{:?}", unko);

    let tuple = (1, 2, 3);

    let x = tuple.0;
    let y = tuple.1;
    let z = tuple.2;

    println!("x is {}", x);
    println!("y is {}", y);
    println!("z is {}", z);
}
