#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    // https://doc.rust-jp.rs/book-ja/ch05-02-example-structs.html
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };

    println!(
        "The area of the rectangle is {} square pixels.",
        area(&rect1)
    );
}

fn area(rectangle: &Rectangle) -> u32 {
    rectangle.width * rectangle.height
}
