include arch/CortexM.mk

TCFLAGS += -mcpu=cortex-m4
TCFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16

HAL = $(CWD)/cubemx/$(HW)/Drivers/STM32F4xx_HAL_Driver
TCFLAGS += -I$(HAL)/Inc
