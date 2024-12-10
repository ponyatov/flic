R += $(wildcard src/*.rs)
O  = $(patsubst src/%.rs,tmp/%.o,$(R))
O += $(patsubst src/%.rl,tmp/%.o,$(wildcard src/%.rl))
B  = $(patsubst src/%.rs,bin/%,$(R))

.PHONY: rust
rust: target/debug/flic
	cargo run

target/debug/flic: $(R) Cargo.toml .cargo/*
	cargo build

tmp/format_rs: $(R)
	cargo check && cargo fmt && touch $@
