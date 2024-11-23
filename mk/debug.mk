# debug
GDBPORT = 12345

REF += $(SWD)/README.md
$(SWD)/README.md:
	$(GITREF) $(GITURL)/cmsis-svd-stm32.git $(dir $@)

.PHONY: flash
flash: $(TMP)/$(HW)/$(MODULE).bin
	st-flash write $< $(ROM)
# --connect-under-reset

.PHONY: openocd
openocd: $(TMP)/$(HW)/$(MODULE).hex
	$@ -c "gdb_port ${GDBPORT}" -f openocd.cfg

.PHONY: gdb
gdb: $(TMP)/$(HW)/$(MODULE).elf
	$@-multiarch -q -ex "target extended-remote :${GDBPORT}" -x .gdbinit $<
