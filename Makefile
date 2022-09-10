TARGETS = \
	tarai-c.exe \
	tarai-go.exe \
	tarai-zig.exe \
	tarai-rust.exe \


all : $(TARGETS)

tarai-c.exe : tarai-c.c
	gcc -O3 $< -o $@

tarai-go.exe : tarai-go.go
	go build -o $@ $<

tarai-zig.exe : tarai-zig.zig
	zig build-exe -Drelease-fast --name tarai-zig $<

tarai-rust.exe : tarai-rust.rs
	rustc -O -o $@ $<

clean :
	rm -f *.exe $(TARGETS)

test:
	@echo ==== C
	@w32time .\tarai-c.exe
	@echo ==== Go
	@w32time .\tarai-go.exe
	@echo ==== Zig
	@w32time .\tarai-zig.exe
	@echo ==== Rust
	@w32time .\tarai-rust.exe
