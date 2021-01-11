use std::io::{self, BufRead};
fn main() {
    // https://users.rust-lang.org/t/problem-with-split-in-map-function/41705/3
    let stdin = io::stdin();
    let lines: Vec<_> = stdin
        .lock()
        .lines()
        .map(|s| {
            s.unwrap()
            .split(' ')
            .map(str::to_owned)
            .collect::<Vec<_>>()
        })
        .collect();
    println!("{:?}", lines);
}
