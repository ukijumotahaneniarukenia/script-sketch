fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/strings.html

    let greeting: &'static str = "Hello there.";
    println!("{}", greeting);

    let s = "foo
bar";

    println!("{}", s);
    let s = "foo\
    bar";

    println!("{}", s); // foobar
    let mut s: String = "Hello".to_string(); // mut s: String
    println!("{}", s); // Hello
    s.push_str(", world.");
    println!("{}", s); // Hello, world.

    fn takes_slice(slice: &str) {
        println!("Got: {}", slice);
    }

    let s = "Hello".to_string();
    takes_slice(&s); // String型から&str型へ変換できる

    let hachiko = "忠犬ハチ公";

    for b in hachiko.as_bytes() {
        print!("{}, ", b);
    } // 229, 191, 160, 231, 138, 172, 227, 131, 143, 227, 131, 129, 229, 133, 172,

    println!("");

    for c in hachiko.chars() {
        print!("{}, ", c);
    } // 忠, 犬, ハ, チ, 公,

    println!("");

    let dog = hachiko.chars().nth(1);

    println!("{}", dog.unwrap()); // 犬

    let dog = "hachiko";
    let hachi = &dog[0..5];
    println!("{}", hachi); // hachi

    let dog = "忠犬ハチ公";
    // let hachi = &dog[0..2];
    // println!("{}", hachi); // マルチバイト文字は実行時エラー

    let hello = "Hello ".to_string();
    let world = "world!";

    let hello_world = hello + world;

    println!("{}", hello_world); // Hello world!

    let hello = "Hello ".to_string();
    let world = "world!".to_string();

    let hello_world = hello + &world; // どちらか一方は &strでないとだめ

    println!("{}", hello_world); // Hello world!
}
