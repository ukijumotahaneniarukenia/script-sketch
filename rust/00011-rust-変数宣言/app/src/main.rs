fn main() {

    // 初期化変数宣言をしないかぎり、エラー
    // 変数宣言のみはエラー

    let x: i32; // unused variable: `x`

    println!("Hello world!");

    println!("The value of x is: {}", x); // borrow of possibly-uninitialized variable: `x`

    // let y: &i32; // unused variable: `x`

    // println!("Hello world!");

    // println!("The value of x is: {}", y); // borrow of possibly-uninitialized variable: `x`
}
