CUBEMX_GZ  = en.stm32cubemx-lin-v$(CUBEMX_VER).zip
CUBEMX_URL = http://klen.org/Files/DevTools/mx/

STM32GIT  = https://github.com/STMicroelectronics
STM32SVD  = https://www.st.com/resource/en/svd
STM32REFS = archive/refs/tags

CUBEF0_URL = $(STM32GIT)/STM32CubeF0/$(STM32REFS)
CUBEF1_URL = $(STM32GIT)/STM32CubeF1/$(STM32REFS)
CUBEF3_URL = $(STM32GIT)/STM32CubeF3/$(STM32REFS)
CUBEF4_URL = $(STM32GIT)/STM32CubeF4/$(STM32REFS)
CUBEL4_URL = $(STM32GIT)/STM32CubeL4/$(STM32REFS)
CUBEH7_URL = $(STM32GIT)/STM32CubeH7/$(STM32REFS)

# GZ += $(DISTR)/SVD/stm32f0_svd.zip
$(DISTR)/SVD/stm32f0_svd.zip:
	$(CURL) $@ $(STM32SVD)/stm32f0_svd.zip
# GZ += $(DISTR)/SVD/stm32f1_svd.zip
$(DISTR)/SVD/stm32f1_svd.zip:
	$(CURL) $@ $(STM32SVD)/stm32f1_svd.zip
# GZ += $(DISTR)/SVD/stm32f4_svd.zip
$(DISTR)/SVD/stm32f4_svd.zip:
	$(CURL) $@ $(STM32SVD)/stm32f4_svd.zip

REF += ref/microrl/README
ref/microrl/README:
	$(call gitref,$@,master)

NEWLIB    = newlib-salsa
NEWLIB_GZ = /usr/src/newlib/newlib-$(NEWLIB_VER).tar.xz

.PHONY: newlib
newlib: $(HOME)/stm32/ref/$(NEWLIB)/README
$(HOME)/stm32/ref/$(NEWLIB)/README: $(NEWLIB_GZ)
	cd $(dir $@)/.. ; xzcat $< | tar x && touch $@
$(NEWLIB_GZ):
	sudo apt install newlib-source
