fn main() {
    let args: Vec<String> = std::env::args().collect();
    println!("{:?}",args);
    println!("{}",args.len());
    println!("{}",&args[args.len()-1]);
    let a = &args[3];
    println!("{}",a);
}
