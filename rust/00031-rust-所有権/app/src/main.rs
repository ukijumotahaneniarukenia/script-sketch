fn main() {

    // Rustでは、基本的に変数の移動は(コピーでなく)ムーブとしてハンドリングされる。
    // これは、「単一リソースの所有権は単一変数に束縛される」という原則による。
    let v = vec![1, 2, 3];

    let v2 = v;

    // println!("v[0] is: {}", v[0]); // error[E0382]: borrow of moved value: `v`

    // プリミティブ型はコピーをデフォルトで保持している
    let x: char = 'う';
    let x2 = x;
    println!("x is: {}", x); // 問題なし
    println!("x2 is: {}", x2); // 問題なし
}
