#![allow(dead_code)]
#![allow(unused_imports)]

mod dline;
use dline::DLine;

// static _z: DLine<f32> = DLine::new(0x10);

fn main() {
    println!("Hello, world!");
    let _f: DLine<f32> = DLine::new(0x10);
    let _d: DLine<f64> = DLine::new(0x10);
}
