# debug
REF += $(HOME)/stm32/ref/cmsis-svd-stm32/README.md
$(HOME)/stm32/ref/cmsis-svd-stm32/README.md:
	$(GITREF) $(GITURL)/cmsis-svd-stm32.git $(dir $@)

.PHONY: flash
flash: $(TMP)/$(HW)/$(MODULE).bin
	st-flash write $< $(ROM)
# --connect-under-reset

.PHONY: openocd
openocd: $(ELF)
	$@ -f $(CWD)/$(HW).openocd -c "program $(TMP)/$(HW)/$(MODULE).elf verify reset"

.PHONY: gdb
gdb: $(ELF)
	$@-multiarch -q -x $(CWD)/$(HW).gdbinit $<

.PHONY: esp
esp: $(CWD)/ref/Espruino/bin/espruino_2v24_stm32f4discovery.elf
	gdb-multiarch -q -x $(CWD)/.gdbinit $<
# cd $(CWD)/ref/Espruino

.PHONY: ddd
ddd: tmp/$(HW)/$(MODULE).elf
	ddd --debugger "gdb-multiarch -q -x .gdbinit" $<
# -q -x .gdbinit $<

.PHONY: dfu
dfu: $(DFU)
	dfu-util --alt 0 --download $< --reset
# --dfuse-address 0x08008000 

RUSTELF = $(CWD)/target/$(RUSTARGET)/debug/$(MODULE)

.PHONY: qemu
qemu: $(RUSTELF)
	$(QEMU) $(QEMU_CFG) -nographic -kernel $< -S -s

.PHONY: qdb
qdb: $(RUSTELF)
	gdb-multiarch -x hw/duino.gdbinit -s $< -e $<
