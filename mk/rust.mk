R += $(wildcard src/*.rs)
RS = $(R) Cargo.toml $(wildcard .cargo/*)

.PHONY: rust
rust: $(RS)
	cargo run

target/debug/flic: $(RS)
	cargo build

tmp/format_rs: $(R)
	cargo check && cargo fmt && touch $@
