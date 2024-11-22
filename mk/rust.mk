R += $(wildcard src/*.rs)
B  = $(patsubst src/%.rs,bin/%,$(R))

.PHONY: rust
rust: bin/$(MODULE)_rs
	$^

bin/$(MODULE)_rs: $(R)
	rustc -o $@ $<

tmp/format_rs: $(R)
	rustfmt $? && touch $@
