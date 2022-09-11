const std = @import("std");

fn tarai(x: i32, y: i32, z: i32) i32 {
    if (x > y) {
        return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y));
    } else {
        return y;
    }
}

pub fn main() !void {
    var allocator = std.heap.page_allocator;
    var args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    if (args.len != 4) {
        std.process.exit(1);
    }
    var x = try std.fmt.parseInt(i32, args[1], 10);
    var y = try std.fmt.parseInt(i32, args[2], 10);
    var z = try std.fmt.parseInt(i32, args[3], 10);
    try std.io.getStdOut().writer().print("{}\n", .{tarai(x, y, z)});
}
