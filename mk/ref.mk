REF += ref/microrl/README
ref/microrl/README:
	$(GITREF) -b master https://github.com/Helius/microrl.git $(dir $@)

REF += $(GZ)/$(CUBEMX_GZ)
$(GZ)/$(CUBEMX_GZ):
	$(CURL) $@ $(CUBEMX_URL)/$(CUBEMX_GZ)

https://github.com/STMicroelectronics/STM32CubeF0/archive/refs/tags/v$(CUBEF0_VER).zip
https://github.com/STMicroelectronics/STM32CubeF1/archive/refs/tags/v$(CUBEF1_VER).zip
https://github.com/STMicroelectronics/STM32CubeF3/archive/refs/tags/v$(CUBEF3_VER).zip
https://github.com/STMicroelectronics/STM32CubeF4/archive/refs/tags/v$(CUBEF4_VER).zip
https://github.com/STMicroelectronics/STM32CubeH7/archive/refs/tags/v$(CUBEH7_VER).zip

.PHONY: ref
ref: $(REF)
