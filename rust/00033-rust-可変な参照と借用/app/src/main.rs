fn main() {
    // https://doc.rust-lang.org/1.30.0/book/first-edition/references-and-borrowing.html#mut-references
    let mut x = 5;
    {
        let y = &mut x;
        println!("{}", y); // 5
        *y += 1;
        println!("{}", y); //6
    }
    println!("{}", x); //6


    // https://doc.rust-lang.org/1.30.0/book/first-edition/references-and-borrowing.html#issues-borrowing-prevents

    let mut v = vec![1, 2, 3];

    // for i in &v {
    //     println!("{}", i);
    //     v.push(34); // error[E0502]: cannot borrow `v` as mutable because it is also borrowed as immutable
    // }

    // for i in &mut v {
    //     println!("{}", i);
    //     v.push(34); // zerror[E0499]: cannot borrow `v` as mutable more than once at a time
    // }

    fn unko(item: u32,list: &mut Vec<u32>) {
        list.push(item);
    }

    println!("{:?}", v);
    unko(34, &mut v);
    println!("{:?}",v);

}
