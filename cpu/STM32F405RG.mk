ARCH      = CortexM4
QEMU_CFG += -cpu cortex-m4

VENDOR = ST
TDEFS += -DSTM32F405xx

TOBJ += $(TMP)/$(HW)/startup_stm32f405xx.o
