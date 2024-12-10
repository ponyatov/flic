R += $(wildcard src/*.rs)
RS = $(R) Cargo.toml $(wildcard .cargo/*)

.PHONY: rust
rust: $(BIN)/$(HW).elf

$(BIN)/$(HW).elf: $(ROBJ)
	$(TLD) -T$(LDS) -o $@ $^

tmp/format_rs: $(R)
	cargo check && cargo fmt && touch $@

$(TMP)/$(HW)/%.o: $(CWD)/hw/$(HW)/%.s
	mkdir -p $(TMP)/$(HW) ; $(TAS) $(TAFLAGS) -o $@ -c $<
