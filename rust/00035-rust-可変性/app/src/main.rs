fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/mutability.html#mutability
    let x = 5;
    // x = 6; // error[E0384]: cannot assign twice to immutable variable `x`

    println!("{:?}", x); // 5

    let mut y = 10;
    println!("{:?}", y); // 10
    y = 100;
    println!("{:?}", y); // 100

    let mut z = 11;

    println!("{:?}", z); // 11

    let x_x = &x;

    println!("{:?}", x_x); // 5

    let y_y = &mut y;

    println!("{:?}", y_y); // 100

    *y_y = 109; // help: consider dereferencing here to assign to the mutable borrowed piece of memory

    println!("{:?}", y_y); // 109

    let mut z_z = &mut z;

    println!("{:?}", z_z); // 11

    *z_z = 2009; // help: consider dereferencing here to assign to the mutable borrowed piece of memory

    println!("{:?}", z_z); // 2009

    let (mut x_x_x, y_y_y) = (5, 6);

    println!("{:?}, {:?}", x_x_x, y_y_y); // 5,6

    x_x_x = 106;

    println!("{:?}, {:?}", x_x_x, y_y_y); // 106,6

    x_x_x = 107;

    println!("{:?}, {:?}", x_x_x, y_y_y); // 107,6

    // y_y_y = 209; // error[E0384]: cannot assign twice to immutable variable `y_y_y`

    fn foo(mut x: i32, y: i32) -> (i32, i32) {
        return (x, y);
    }

    let result = foo(x_x_x, y_y_y);

    println!("{:?}", result); // (107, 6)
}
