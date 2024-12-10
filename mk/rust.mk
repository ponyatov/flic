R += $(wildcard src/*.rs)
RS = $(R) Cargo.toml $(wildcard .cargo/*)

# CORE_SRC = $(CWD)/hw/$(HW)/Core/Src
# ROBJ     = $(patsubst $(CORE_SRC)/%.c,$(TMP)/$(HW)/%.o,$(wildcard $(CORE_SRC)/*.c*))

.PHONY: rust
rust: $(BIN)/$(BINAME).elf

tmp/format_rs: $(R)
	cargo check && cargo fmt && touch $@
