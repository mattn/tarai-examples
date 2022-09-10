const std = @import("std");

fn tarai(x: i32, y: i32, z: i32) i32 {
    if (x > y) {
        return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y));
    } else {
        return y;
    }
}

pub fn main() !void {
    try std.io.getStdOut().writer().print("{}\n", .{tarai(14, 7, 0)});
}
