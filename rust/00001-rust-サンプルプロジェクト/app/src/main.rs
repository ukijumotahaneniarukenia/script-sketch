use std::io::{self, BufRead};
fn main() {
    // https://users.rust-lang.org/t/problem-with-split-in-map-function/41705/3
    let stdin = io::stdin();
    let mut row_list = Vec::<Vec<String>>::new();
    for line in stdin.lock().lines() {
        let col_list: Vec<_> = line.ok().unwrap().split(' ').map(str::to_owned).collect::<Vec<_>>();
        row_list.push(col_list);
    }
    println!("{:?}", row_list);
}
