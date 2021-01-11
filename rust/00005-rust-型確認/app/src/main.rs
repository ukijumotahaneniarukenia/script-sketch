use std::any::type_name;

fn type_of<T>(_: T) -> &'static str {
    type_name::<T>()
}
fn main() {
    let x = 21;
    let y = 2.5;
    let z = "うんこ";
    println!("{}", type_of(&y));
    println!("{}", type_of(x));
    println!("{}", type_of(z));
}
