const fn tarai(x: i32, y: i32, z: i32) -> i32 {
    if x > y {
        tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
    } else {
        y
    }
}

fn main() {
    println!("{}", tarai(14, 7, 0));
}
