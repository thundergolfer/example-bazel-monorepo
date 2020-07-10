extern crate rand;

fn main() {
    // Statements here are executed when the compiled binary is called

    // Print text to the console
    println!("Hello World!");

    let x = rand::random::<u8>();
    println!("Here's a random number: {}", x);
}
