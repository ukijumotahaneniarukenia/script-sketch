fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/loops.html#loops

    // 無限ループ
    loop {
        println!("うんこ");
    }

    while true { // warning: denote infinite loops with `loop { ... }`
        println!("うんこ");
    }

    let mut x: i32 = 5; // mut x: i32
    let mut done: bool = false; // mut done: bool

    while !done {
        // x = x - 3;

        // println!("{}", x);

        x += x - 3; // >>> x = x + x -3

        println!("{}", x);

        if x % 5 == 0 {
            done = true;
        }
    }

    for x in 0..10 {
        println!("{}", x); // x: i32
    }

    for (index, value) in (5..10).enumerate() {
        println!("index = {} and value = {}", index, value);
    }

    let lines = "hello\nworld".lines();

    println!("{:?}", lines);

    for (linenumber, line) in lines.enumerate() {
        println!("{}: {}", linenumber, line);
    }

    let mut x = 5;

    loop {
        x += x - 3;

        println!("{}", x);

        if x % 5 == 0 {
            break;
        }
    }

    for x in 0..10 {
        if x % 2 == 0 {
            continue;
        }
        println!("{}", x);
    }

    'outer: for x in 0..10 {
        'inner: for y in 0..10 {
            if x % 2 == 0 {
                continue 'outer;
            } // Continues the loop over `x`.
            if y % 2 == 0 {
                continue 'inner;
            } // Continues the loop over `y`.
            println!("x: {}, y: {}", x, y);
        }
    }
}
