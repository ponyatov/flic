const ABOUT: &str = "FORTH.rs: tiny pure REPL/CLI system in Rust (embedded)";
const AUTHOR: &str = "(c) Dmitry Ponyatov <dponyatov@gmail.com> 2024 MIT";

const INI: &'static str = include_str!("../lib/FORTH.ini");

fn main() {
    println!("\n{}\n{}\n", ABOUT, AUTHOR);
    println!("{}", INI);
}
