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
	$@-multiarch -q -x .gdbinit $<

.PHONY: ddd
ddd: tmp/$(HW)/$(MODULE).elf
	ddd --debugger "gdb-multiarch -q -x .gdbinit" $<
# -q -x .gdbinit $<
