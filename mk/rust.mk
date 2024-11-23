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

tmp/%.o: tmp/%.c
	$(CC) -c -o $@ $<
tmp/%.c: src/%.rl
	ragel -L -G2 -o $@ $<

tmp/format_rs: $(R)
	rustfmt $? && touch $@
