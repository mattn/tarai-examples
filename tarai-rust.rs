use std::env;
use std::process;

const fn tarai(x: i32, y: i32, z: i32) -> i32 {
    if x > y {
        tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
    } else {
        y
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        process::exit(1);
    }
    let x: i32 = args[1].parse().unwrap_or(14);
    let y: i32 = args[2].parse().unwrap_or(7);
    let z: i32 = args[3].parse().unwrap_or(0);
    println!("{}", tarai(x, y, z));
}
