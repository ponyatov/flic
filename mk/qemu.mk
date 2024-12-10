.PHONY: qemu
qemu: bin/$(HW).elf
	$(QEMU) $(QEMU_CFG) -nographic -kernel $<
# target/debug/arm-none-eabi-flic
# -kernel $<
