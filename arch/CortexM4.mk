include arch/CortexM.mk

QEMU_CFG += -M netduinoplus2

TCPU += -mcpu=cortex-m4
TCPU += -mfpu=fpv4-sp-d16 -mfloat-abi=hard

SERIES = STM32F4

RUSTARGET = thumbv7em-none-eabihf
