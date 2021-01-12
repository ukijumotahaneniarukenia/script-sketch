fn main() {
    #[derive(Debug)]
    enum Message {
        Quit,
        ChangeColor(i32, i32, i32),
        Move { x: i32, y: i32 },
        Write(String),
    }
    let x: Message = Message::Move { x: 3, y: 4 };

    println!("{:?}", x); // Move { x: 3, y: 4 }

    #[derive(Debug)]
    enum BoardGameTurn {
        Move { squares: i32 },
        Pass,
    }

    let y: BoardGameTurn = BoardGameTurn::Move { squares: 1 };

    println!("{:?}", y); // Move { squares: 1 }

    let m = Message::Write("Hello, world".to_string());

    println!("{:?}", m); // Write("Hello, world")

    let v = vec!["Hello".to_string(), "World".to_string()];

    println!("{:?}", v); // ["Hello", "World"]


    // collectのfinisherはjavaっぽい
    let v1: Vec<Message> = v.into_iter().map(Message::Write).collect();

    println!("{:?}", v1); // [Write("Hello"), Write("World")]
}
