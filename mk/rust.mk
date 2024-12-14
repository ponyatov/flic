R += $(wildcard src/*.rs)
RS = $(R) Cargo.toml $(wildcard .cargo/*)

# CORE_SRC = $(CWD)/hw/$(HW)/Core/Src
# ROBJ     = $(patsubst $(CORE_SRC)/%.c,$(TMP)/$(HW)/%.o,$(wildcard $(CORE_SRC)/*.c*))

# TRIPLET = thumbv7em-none-eabihf

.PHONY: rust
rust:
	cargo build && cargo size
#	cargo rustc --target $(TRIPLET) -- \
#		-C link-arg=-nostartfiles -C link-arg=-Tlink.x

tmp/format_rs: $(R)
	cargo fmt && touch $@

.PHONY: size
size:
	cargo size -- -Ax
