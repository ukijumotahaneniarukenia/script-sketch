// https://doc.rust-jp.rs/book-ja/ch05-01-defining-structs.html

#[derive(Debug)]
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

fn build_user(target_email: String, target_username: String) -> User {
    User {
        email: target_email,
        username: target_username,
        active: true,
        sign_in_count: 1,
    }
}

fn main() {
    let user1 = User {
        email: String::from("someone@example.com"),
        username: String::from("someusername123"),
        active: true,
        sign_in_count: 1,
    };
    println!("{:?}", user1); // User { username: "someusername123", email: "someone@example.com", sign_in_count: 1, active: true }
    let mut user1 = User {
        email: String::from("someone@example.com"),
        username: String::from("someusername123"),
        active: true,
        sign_in_count: 1,
    };
    println!("{:?}", user1); // User { username: "someusername123", email: "someone@example.com", sign_in_count: 1, active: true }
    user1.email = String::from("anotheremail@example.com");
    println!("{:?}", user1); // User { username: "someusername123", email: "anotheremail@example.com", sign_in_count: 1, active: true }

    let user1 = build_user("sample@example.com".to_string(),"unko".to_string());
    println!("{:?}", user1); // User { username: "unko", email: "sample@example.com", sign_in_count: 1, active: true }

    let user1 = build_user("SAMPLE@example.com".to_string(),"MORIMORI".to_string());
    println!("{:?}", user1); // User { username: "MORIMORI", email: "SAMPLE@example.com", sign_in_count: 1, active: true }

}
