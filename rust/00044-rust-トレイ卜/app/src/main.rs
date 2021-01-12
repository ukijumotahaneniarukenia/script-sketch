trait HasArea {
    // 抽象メソッド
    fn area(&self) -> f64;
}

#[derive(Debug)]
struct Circle {
    x: f64,
    y: f64,
    radius: f64,
}

impl HasArea for Circle {
    // トレイトを持ち回って具象メソッド
    fn area(&self) -> f64 {
        std::f64::consts::PI * (self.radius * self.radius)
    }
}

#[derive(Debug)]
struct Square {
    x: f64,
    y: f64,
    side: f64,
}

impl HasArea for Square {
    // トレイトを持ち回って具象メソッド
    fn area(&self) -> f64 {
        self.side * self.side
    }
}

fn print_area<T: HasArea>(shape: T) {
    println!("This shape has an area of {}", shape.area());
}

#[derive(Debug)]
// 各フィールドの型をダイナミックに実行時に指定できるようにする
struct Rectangle<T> {
    x: T,
    y: T,
    width: T,
    height: T,
}

impl<T: PartialEq> Rectangle<T> {
    fn is_square(&self) -> bool {
        self.width == self.height
    }
}

fn main() {
    let c = Circle {
        x: 0.0f64,
        y: 0.0f64,
        radius: 1.0f64,
    };

    println!("{:?}", c);

    let s = Square {
        x: 0.0f64,
        y: 0.0f64,
        side: 1.0f64,
    };

    println!("{:?}", s);

    // 共通のインターフェースを実装した異なる型を受け取って型ごとに実装した具象メソッドを実行できる
    print_area(c);
    print_area(s);

    let mut r = Rectangle {
        x: 0,
        y: 0,
        width: 47,
        height: 47,
    };

    println!("{:?}", r);

    println!("{:?}", r.is_square());

    r.height = 42;
    println!("{:?}", r.is_square());
}
