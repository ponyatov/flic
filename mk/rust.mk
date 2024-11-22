R += $(wildcard src/*.rs)
B  = $(patsubst src/%.rs,tmp/%.o,$(R))

.PHONY: rust
rust: $(B)
	ls -la $^ ; file $^

tmp/%.o: src/%.rs
	rustc -o $@ $<
