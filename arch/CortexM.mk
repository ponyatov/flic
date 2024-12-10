TARGET = arm-none-eabi
APT   += gcc-$(TARGET) gdb-multiarch stlink-tools dfu-util qemu-system-arm
OS    ?= _
ROM    = 0x08000000
QEMU   = qemu-system-arm

# arch/CortexM

TCPU    += -mthumb

CORE     = $(CWD)/hw/$(HW)/Core
TAFLAGS += -I$(CORE)/Inc
TOBJ    += $(patsubst $(CORE)/Src/%.c,$(TMP)/$(HW)/%.o,$(wildcard $(CORE)/Src/*.c))

DRIVERS  = $(CWD)/hw/$(HW)/Drivers

HALDRV   = $(DRIVERS)/$(SERIES)xx_HAL_Driver
TAFLAGS += -I$(HALDRV)/Inc
TOBJ    += $(patsubst $(HALDRV)/Src/%.c,$(TMP)/$(HW)/%.o,$(wildcard $(HALDRV)/Src/*.c))

CMSISDRV = $(DRIVERS)/CMSIS
TAFLAGS += -I$(CMSISDRV)/Device/$(VENDOR)/$(SERIES)xx/Include
TAFLAGS += -I$(CMSISDRV)/Include

# tool: CubeMX binary path
CUBEMX ?= $(HOME)/STM32/CubeMX/STM32CubeMX

# run make cubemx
.PHONY: cubemx
cubemx: $(CUBEMX)
	$<

# CubeMX automated install
CUBE_SDIR  = $(TMP)/cubemx
CUBE_SETUP = SetupSTM32CubeMX-$(CUBEMX_VER)

$(CUBEMX):
	$(MAKE) $(CUBE_SDIR)/$(CUBE_SETUP)
	$(CUBE_SDIR)/$(CUBE_SETUP)

$(CUBE_SDIR)/$(CUBE_SETUP): $(DISTR)/$(CUBEMX_GZ)
	unzip -d $(CUBE_SDIR) $< && touch $@

GZ += $(DISTR)/$(CUBEMX_GZ)
$(DISTR)/$(CUBEMX_GZ):
	$(CURL) $@ $(CUBEMX_URL)/$(subst .,-,$(CUBEMX_GZ))
