include mk/var.mk
include mk/version.mk
include mk/cross.mk
include mk/dirs.mk
include mk/tool.mk
include mk/src.mk
include mk/package.mk
include mk/cfg.mk
include mk/all.mk
include mk/format.mk
include mk/rule.mk
include mk/debug.mk
include mk/doc.mk
include mk/install.mk
include mk/merge.mk
include mk/rust.mk

# .PHONY: disco
# disco:
# 	rm -rf $(TMP)/$(HW)
# 	$(CMAKE) -DCMAKE_VERBOSE_MAKEFILE=ON \
# 		-S$(CWD) -B$(TMP)/$(HW) --preset=$(HW)
# 	$(CMAKE) --build $(TMP)/$(HW)

.PHONY: openocd
openocd: $(TMP)/$(HW)/$(MODULE).hex
	$@

.PHONY: gdb
gdb: $(TMP)/$(HW)/$(MODULE).elf
	$@-multiarch -q -x .gdbinit $<

# .PHONY: flash
# flash: $(TMP)/$(HW)/$(MODULE).bin
# 	st-flash --connect-under-reset write $< $(FLASH)
# %.bin: %.elf
# 	arm-none-eabi-objcopy -O binary $< $@
