.PHONY: all run host
all: $(ELF) $(F)
run: $(ELF) $(F)
host:
	$(shell HW=_ make run)

.PHONY: elf
elf: $(ELF)
	echo $<

$(RUSTELF): $(RS)
	cargo build
