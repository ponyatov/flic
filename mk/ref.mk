REF += ref/microrl/README
ref/microrl/README:
	$(GITREF) -b master https://github.com/Helius/microrl.git $(dir $@)

GZ += $(CROSS)/$(CUBEMX_GZ)
$(CROSS)/$(CUBEMX_GZ):
	$(CURL) $@ $(CUBEMX_URL)/$(CUBEMX_GZ)

REF += ref/STM32CubeF0/README.md
ref/STM32CubeF0/README.md: $(CROSS)/$(CUBEF0_GZ)
GZ += $(CROSS)/$(CUBEF0_GZ)
$(CROSS)/$(CUBEF0_GZ):
	$(CURL) $@ $(CUBEF0_URL)/v$(CUBEF0_VER).zip

# ref/STM32CubeF1/README.md: $(CROSS)/$(CUBEF1_GZ)
# $(CROSS)/$(CUBEF1_GZ):
# 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeF1/archive/refs/tags/v$(CUBEF1_VER).zip

# ref/STM32CubeF3/README.md: $(CROSS)/$(CUBEF0_GZ)
# $(CROSS)/$(CUBEF0_GZ):
# 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeF3/archive/refs/tags/v$(CUBEF3_VER).zip

# ref/STM32CubeF0/README.md: $(CROSS)/$(CUBEF0_GZ)
# $(CROSS)/$(CUBEF0_GZ):
# 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeF4/archive/refs/tags/v$(CUBEF4_VER).zip

# ref/STM32CubeF0/README.md: $(CROSS)/$(CUBEF0_GZ)
# $(CROSS)/$(CUBEF0_GZ):
# 	$(CURL) $@ https://github.com/STMicroelectronics/STM32CubeH7/archive/refs/tags/v$(CUBEH7_VER).zip
