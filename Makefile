ifeq ($(OS),Windows_NT)
EXT = .exe
TIME = w32time
else
TIME = time
endif

TARGETS = \
	tarai-c$(EXT) \
	tarai-go$(EXT) \
	tarai-zig$(EXT) \
	tarai-rust$(EXT) \


all : $(TARGETS)

tarai-c$(EXT) : tarai-c.c
	gcc -O3 $< -o $@

tarai-go$(EXT) : tarai-go.go
	go build -o $@ $<

tarai-zig$(EXT) : tarai-zig.zig
	zig build-exe -O ReleaseFast --name tarai-zig $<

tarai-rust$(EXT) : tarai-rust.rs
	rustc -O -o $@ $<

clean :
	rm -f *.exe $(TARGETS)

test:
	@echo ==== C
	$(TIME) ./tarai-c$(EXT)
	@echo ==== Go
	@$(TIME) ./tarai-go$(EXT)
	@echo ==== Zig
	@$(TIME) ./tarai-zig$(EXT)
	@echo ==== Rust
	@$(TIME) ./tarai-rust$(EXT)
