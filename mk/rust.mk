R += $(wildcard src/*.rs)
B  = $(patsubst src/%.rs,bin/%,$(R))

.PHONY: rust
rust: bin/FORTH
	$^

bin/FORTH: $(R) lib/FORTH.ini
	rustc -o $@ $<

tmp/format_rs: $(R)
	rustfmt $? && touch $@
