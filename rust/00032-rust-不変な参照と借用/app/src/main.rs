fn print_all(v: Vec<u64>) {
    for val in v {
        println!("{}", val);
    }
}

fn print_all_ref(v: &Vec<u64>) {
    for val in v {
        println!("{}", val);
    }
}

fn foo(v1: Vec<i32>, v2: Vec<i32>) -> (Vec<i32>, Vec<i32>, i32) {
    // Do stuff with `v1` and `v2`.

    // Hand back ownership, and the result of our function.
    (v1, v2, 42)
}

fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/references-and-borrowing.html
    // https://qiita.com/EqualL2/items/a232ab0855f145bd5997#%E6%89%80%E6%9C%89%E6%A8%A9
    let v: Vec<u64> = vec![1, 2, 3, 4, 5];
    // print_all(v); // 問題なし
    // print_all(v); // value used here after move

    // 参照を通じて所有権を借用(borrow)し、貸し与えることができる
    print_all_ref(&v); //
    print_all_ref(&v); //
    let v1 = vec![1, 2, 3];
    let v2 = vec![1, 2, 3];
    let (v1, v2, answer) = foo(v1, v2);
    println!("{:?}", v1);
    println!("{:?}", v2);
    println!("{:?}", answer);

    fn sum_vec(v: &Vec<i32>) -> i32 {
        return v.iter().fold(0, |a, &b| a + b)
    }
    // Borrow two vectors and sum them.
    // This kind of borrowing does not allow mutation through the borrowed reference.
    fn bar(v1: &Vec<i32>, v2: &Vec<i32>) -> i32 {
        // Do stuff with `v1` and `v2`.
        let s1 = sum_vec(v1);
        let s2 = sum_vec(v2);
        // Return the answer.
        return s1 + s2
    }

    let v1 = vec![1, 2, 3];
    let v2 = vec![4, 5, 6];

    let answer = bar(&v1, &v2);
    println!("{}", answer);
}
