use regex::Regex;
use std::io::{self, BufRead};

fn main() {
    // https://docs.rs/regex/1.4.3/regex/
    // https://docs.rs/regex/1.4.3/regex/struct.Regex.html
    let re = Regex::new(r"").unwrap();
    let stdin = io::stdin();
    let mut row_list = Vec::<Vec<String>>::new();
    for line in stdin.lock().lines() {
        let col_list: Vec<_> = re.split(&line.ok().unwrap()).map(str::to_owned).filter(|item| item != "").collect::<Vec<_>>();
        row_list.push(col_list);
    }
    println!("{:?}", row_list);
}
