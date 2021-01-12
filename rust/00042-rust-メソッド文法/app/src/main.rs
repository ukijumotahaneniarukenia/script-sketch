#[derive(Debug)]
struct Circle {
    x: f64,
    y: f64,
    radius: f64,
}

#[derive(Debug)]
struct CircleBuilder {
    x: f64,
    y: f64,
    radius: f64,
}

impl CircleBuilder {
    fn new() -> CircleBuilder {
        CircleBuilder {
            x: 0.0,
            y: 0.0,
            radius: 1.0,
        }
    }

    fn x(&mut self, coordinate: f64) -> &mut CircleBuilder {
        self.x = coordinate;
        self
    }

    fn y(&mut self, coordinate: f64) -> &mut CircleBuilder {
        self.y = coordinate;
        self
    }

    fn radius(&mut self, radius: f64) -> &mut CircleBuilder {
        self.radius = radius;
        self
    }

    fn finalize(&self) -> Circle {
        Circle {
            x: self.x,
            y: self.y,
            radius: self.radius,
        }
    }
}

// Circleクラスにメソッド定義している
impl Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * (self.radius * self.radius)
    }
    fn reference(&self) {
        println!("taking self by reference!");
    }

    fn mutable_reference(&mut self) {
        println!("taking self by mutable reference!");
    }

    fn takes_ownership(self) {
        println!("taking ownership of self!");
    }
    fn grow(&self, increment: f64) -> Circle {
        return Circle {
            x: self.x,
            y: self.y,
            radius: self.radius + increment,
        };
    }

    // 一つのメソッドとしてコンストラクタを定義
    fn newCircle(x: f64, y: f64, radius: f64) -> Circle {
        Circle {
            x: x,
            y: y,
            radius: radius,
        }
    }
}

fn main() {
    // 初期化
    let mut c = Circle {
        x: 0.0,
        y: 0.0,
        radius: 2.0,
    };
    println!("{:?}", c); // Circle { x: 0.0, y: 0.0, radius: 2.0 }
    println!("{}", c.area()); // 12.566370614359172

    c.reference();
    c.mutable_reference(); // error[E0596]: cannot borrow `c` as mutable, as it is not declared as mutable なので 宣言時にmut識別子を付与し 変更可能として貸し出せるようにする

    let d = c.grow(2.0).area();
    println!("{}", d); // 50.26548245743669

    c.takes_ownership(); // error[E0382]: borrow of moved value: `c` ムーブされると可変な参照も不変な参照も所有権も貸し出せないので、最後に実行

    let c = Circle::newCircle(0.0, 0.0, 2.0);
    println!("{:?}", c); // Circle { x: 0.0, y: 0.0, radius: 2.0 }
    let d = c.grow(5.0).area();
    println!("{}", d); // 153.93804002589985

    let c = CircleBuilder::new().x(1.0).y(2.0).radius(2.0).finalize();

    println!("{:?}", c); // Circle { x: 1.0, y: 2.0, radius: 2.0 }
    println!("area: {}", c.area());
    println!("x: {}", c.x);
    println!("y: {}", c.y);
}
