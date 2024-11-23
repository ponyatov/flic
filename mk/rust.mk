R += $(wildcard src/*.rs)
O  = $(patsubst src/%.rs,tmp/%.o,$(R))
O += $(patsubst src/%.rl,tmp/%.o,$(wildcard src/%.rl))
B  = $(patsubst src/%.rs,bin/%,$(R))

.PHONY: rust
rust: bin/FORTH
	$^

bin/FORTH: $(O) 
	echo $^

tmp/%.o: tmp/%.rs lib/FORTH.ini
	rustc -o $@ $<

tmp/%.o: src/%.rl
	ragel -G2 -o $@.c $<
	$(CC) -c -o $@ $@.c

tmp/format_rs: $(R)
	rustfmt $? && touch $@
