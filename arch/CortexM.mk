TARGET = arm-none-eabi
APT   += gcc-$(TARGET) gdb-multiarch stlink-tools dfu-util qemu-system-arm
OS    ?= _
ROM    = 0x08000000

# arch/CortexM
CORE     = $(CWD)/cubemx/$(HW)/Core
TCFLAGS += -I$(CORE)/Inc
OBJ     += $(patsubst $(CORE)/Src/%.c,$(TMP)/core_%.o,$(wildcard $(CORE)/Src/*.c*))

CMSIS = $(CWD)/cubemx/STM32F407G-DISC1/Drivers/CMSIS
TCFLAGS += -I$(CMSIS)/Device/ST/STM32F4xx/Include
TCFLAGS += -I$(CMSIS)/Include

TCFLAGS += -mthumb

TLFLAGS += --specs=nano.specs
TLFLAGS += -Wl,-Map=$(BIN)/$(MODULE)_$(HW).map -Wl,--gc-sections
TLFLAGS += -Wl,--start-group -lc -lm -Wl,--end-group

# TXFLAGS += -fno-rtti -fno-exceptions
# TLFLAGS += -Wl,--start-group -lstdc++ -lsupc++ -Wl,--end-group"

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
