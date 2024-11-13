TARGET = arm-none-eabi
APT   += gcc-$(TARGET) gdb-multiarch stlink-tools

# cross-compiler
TCC   = $(TARGET)-gcc
TXX   = $(TARGET)-g++
TDUMP = $(TARGET)-objdump
TSIZE = $(TARGET)-size
TCOPY = $(TARGET)-objcopy

# tool: CubeMX binary path
CUBEMX ?= $(HOME)/STM32/CubeMX/STM32CubeMX
GZ     += $(CUBEMX)

# run make cubemx
.PHONY: cubemx
cubemx: $(CUBEMX)
	$<

# CubeMX automated install
CUBE_SDIR  = tmp/cubemx
CUBE_SETUP = SetupSTM32CubeMX-$(subst -,.,$(CUBEMX_VER))

GZ += $(CUBEMX)
$(CUBEMX):
	$(MAKE) $(CUBE_SDIR)/$(CUBE_SETUP)
	$(CUBE_SDIR)/$(CUBE_SETUP)

$(CUBE_SDIR)/$(CUBE_SETUP): $(CROSS)/$(CUBEMX_GZ)
	unzip -d $(CUBE_SDIR) $< && touch $@

GZ += $(CROSS)/$(CUBEMX_GZ)
$(CROSS)/$(CUBEMX_GZ):
	$(CURL) $@ $(CUBEMX_URL)/$(CUBEMX_GZ)

# REF += ref/STM32CubeF0/README.md
# ref/STM32CubeF0/README.md: $(CROSS)/$(CUBEF0_GZ)
# GZ += $(CROSS)/$(CUBEF0_GZ)
# $(CROSS)/$(CUBEF0_GZ):
# 	$(CURL) $@ $(CUBEF0_URL)/v$(CUBEF0_VER).zip

# # ref/STM32CubeF1/README.md: $(CROSS)/$(CUBEF1_GZ)
# # $(CROSS)/$(CUBEF1_GZ):
# # 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeF1/archive/refs/tags/v$(CUBEF1_VER).zip

# # ref/STM32CubeF3/README.md: $(CROSS)/$(CUBEF0_GZ)
# # $(CROSS)/$(CUBEF0_GZ):
# # 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeF3/archive/refs/tags/v$(CUBEF3_VER).zip

# # ref/STM32CubeF0/README.md: $(CROSS)/$(CUBEF0_GZ)
# # $(CROSS)/$(CUBEF0_GZ):
# # 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeF4/archive/refs/tags/v$(CUBEF4_VER).zip

# # ref/STM32CubeF0/README.md: $(CROSS)/$(CUBEF0_GZ)
# # $(CROSS)/$(CUBEF0_GZ):
# # 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeH7/archive/refs/tags/v$(CUBEH7_VER).zip
