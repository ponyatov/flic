// https://youtu.be/TOAynddiu5M?si=YAYk1NlHS_rf7bre

#![no_std]
#![no_main]
#![allow(non_upper_case_globals)]
#![allow(dead_code)]

use cortex_m_rt::entry;
use panic_halt as _;

const hello: &str = "Hello, world!";

#[entry]
fn main() -> ! {
    // println!(hello);
    loop {}
}
