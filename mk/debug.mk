# debug
REF += $(SWD)/README.md
$(SWD)/README.md:
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
