fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/match.html

    let x = 5;

    match x {
        1 => println!("one"),
        2 => println!("two"),
        3 => println!("three"),
        4 => println!("four"),
        5 => println!("five"),
        _ => println!("other"),
    }

    #[derive(Debug)]
    enum Message {
        Quit,
        ChangeColor(i32, i32, i32),
        Move { x: i32, y: i32 },
        Write(String),
    }

    fn quit() { /* ... */
    }
    fn chaxe_cursor(x: i32, y: i32) { /* ... */
    }
    fn move_cursor(x: i32, y: i32) {
        x + 2;
        y + 5;
    }
    fn change_color(x: i32, y: i32, z: i32) {}
    fn process_message(msg: Message) {
        match msg {
            Message::Quit => quit(),
            Message::ChangeColor(r, g, b) => change_color(r, g, b),
            Message::Move {
                x,
                y: new_name_for_y,
            } => move_cursor(x, new_name_for_y),
            Message::Write(s) => println!("{}", s),
        };
    }

    let y: Message = Message::Move { x: 3, y: 4 };

    println!("{:?}", y); // Move { x: 3, y: 4 }
}
