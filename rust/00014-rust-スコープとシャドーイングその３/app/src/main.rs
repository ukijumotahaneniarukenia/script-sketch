fn main() {
    let mut x: i32 = 1;
    println!("{}", x);
    x = 7;
    println!("{}", x);
    x = 14;
    println!("{}", x);
    let x = x; // `x` is now immutable and is bound to `7`.
    println!("{}", x);
    // x = 10; // error[E0384]: cannot assign twice to immutable variable `x`
    // println!("{}", x);
    let y = 4;
    println!("{},{}",x, y);
    let y = "I can also be bound to text!"; // `y` is now of a different type.
    println!("{},{}",x, y);
}
