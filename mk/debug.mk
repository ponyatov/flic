# debug
REF += $(HOME)/stm32/ref/cmsis-svd-stm32/README.md
$(HOME)/stm32/ref/cmsis-svd-stm32/README.md:
	$(GITREF) $(GITURL)/cmsis-svd-stm32.git $(dir $@)

.PHONY: flash
flash: $(TMP)/$(HW)/$(MODULE).bin
	st-flash write $< $(ROM)
# --connect-under-reset

.PHONY: openocd
openocd: $(TMP)/$(HW)/$(MODULE).hex
	$@ -f openocd.cfg

.PHONY: gdb
gdb: $(TMP)/$(HW)/$(MODULE).elf
	$@-multiarch -q -x $(CWD)/.gdbinit $<

.PHONY: esp
esp: $(CWD)/ref/Espruino/bin/espruino_2v24_stm32f4discovery.elf
	gdb-multiarch -q -x $(CWD)/.gdbinit $<
# cd $(CWD)/ref/Espruino

.PHONY: ddd
ddd: tmp/$(HW)/$(MODULE).elf
	ddd --debugger "gdb-multiarch -q -x .gdbinit" $<
# -q -x .gdbinit $<

.PHONY: iskra
iskra:
	cd ref/iskrajs ;\
	BOARD=ISKRAJS DEBUG=1 make

.PHONY: dfu
dfu: ref/iskrajs/bin/horizon_2v22_241203_1747.bin
	dfu-util --alt 0 --download $< --dfuse-address 0x08008000 
# --reset

.PHONY: qemu
qemu: $(TMP)/$(HW)/$(MODULE).elf
	$(QEMU) $(QEMU_CFG) -nographic -kernel $< -S -s
