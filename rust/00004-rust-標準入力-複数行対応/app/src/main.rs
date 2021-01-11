use std::io::{self, BufRead};

// https://github.com/baban/rust_test/blob/master/catalan.rs
fn make_column_list(target_row: &str , target_row_list: &mut Vec<Vec<&str>>) {
    target_row_list.push(target_row.split(' ').collect::<Vec<&str>>());
}

fn main() {
    let stdin = io::stdin();

    let mut row_list: Vec<Vec<&str>> = Vec::new();

    for line in stdin.lock().lines() {
        let row: &str= &line.unwrap();
        // make_column_list(row, &mut row_list);
    }

    println!("{:?}", row_list);
}
