# STM32F405RG
QEMU     = qemu-system-arm
QEMU_CFG = -M netduinoplus2 -cpu cortex-m4

.PHONY: qemu
qemu: target/debug/arm-none-eabi-flic
	$(QEMU) $(QEMU_CFG) -kernel $<
