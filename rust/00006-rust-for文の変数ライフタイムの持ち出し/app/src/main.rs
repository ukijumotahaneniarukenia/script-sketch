fn print_all(v: &Vec<u64>){
    for val in v {
        println!("{}",val);
    }
}

// https://qiita.com/EqualL2/items/a232ab0855f145bd5997#%E3%83%AB%E3%83%BC%E3%83%97

// シングルクォートがみそ
fn main() {
    let v = vec![1, 2, 3, 4, 5];
    // for val in v {
    //     // 問題なし
    //     println!("{}", val);
    // }

    // for val in v {
    //     // エラー:vはムーブ済み
    //     println!("{}", val);
    // }
    // Rustでは(不変な)参照はいくつ作っても良いことになっている
    // &Tで「参照をコピーして持ち出す」
    print_all(&v); // 問題なし
    print_all(&v); // 問題なし


}
