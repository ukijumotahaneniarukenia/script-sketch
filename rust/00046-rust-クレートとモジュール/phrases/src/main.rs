extern crate phrases;

extern crate phrases as sayings;

use sayings::japanese::greetings as ja_greetings;
use sayings::japanese::farewells::*;
use sayings::english::{self, greetings as en_greetings, farewells as en_farewells};

// use phrases::english::greetings::hello;
use phrases::english::farewells::goodbye;

// これと
use phrases::english::{greetings,farewells};

// これはおなじ
// use phrases::english::greetings;
// use phrases::english::farewells;


use phrases::japanese::greetings::hello;

fn main() {
    // println!("Hello in English: {}", greetings::hello());
    // println!("Goodbye in English: {}", farewells::goodbye());
    // println!("Hello in English: {}", hello());
    // println!("Goodbye in English: {}", goodbye());
    // println!("Hello in English: {}", phrases::english::greetings::hello());
    // println!("Goodbye in English: {}", phrases::english::farewells::goodbye());





    println!("Hello in English; {}", en_greetings::hello());
    println!("And in Japanese: {}", ja_greetings::hello());
    println!("Goodbye in English: {}", english::farewells::goodbye());
    println!("Again: {}", en_farewells::goodbye());
    println!("And in Japanese: {}", goodbye());
}
