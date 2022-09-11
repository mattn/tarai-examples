use std::time::Instant;

const fn tarai(x: i32, y: i32, z: i32) -> i32 {
    if x > y {
        tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
    } else {
        y
    }
}

fn main() {
    let start_tarai = Instant::now();

    println!("{}", tarai(14, 7, 0));

    let end_tarai = start_tarai.elapsed();

    let tarai_sec = end_tarai.as_secs() as f64 + end_tarai.subsec_nanos() as f64 / 1000_000_000.0;

    println!("{}", tarai_sec);
}
