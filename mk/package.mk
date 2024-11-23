
# CUBEMX_GZ  = en.stm32cubemx-lin-v$(CUBEMX_VER).zip
# CUBEMX_URL = http://klen.org/Files/DevTools/mx/

STM32GIT  = https://github.com/STMicroelectronics
STM32REFS = archive/refs/tags

CUBEF0_URL = $(STM32GIT)/STM32CubeF0/$(STM32REFS)
CUBEF1_URL = $(STM32GIT)/STM32CubeF1/$(STM32REFS)
CUBEF3_URL = $(STM32GIT)/STM32CubeF3/$(STM32REFS)
CUBEF4_URL = $(STM32GIT)/STM32CubeF4/$(STM32REFS)
CUBEL4_URL = $(STM32GIT)/STM32CubeL4/$(STM32REFS)
CUBEH7_URL = $(STM32GIT)/STM32CubeH7/$(STM32REFS)

REF += ref/microrl/README
ref/microrl/README:
	$(call gitref,$@,master)
# # readline
# .PHONY: microrl
# microrl: $(SRC)/microrl.c $(INC)/microrl.h $(INC)/config.h
# $(SRC)/%.c: $(REF)/microrl/src/%.c $(INC)/%.h $(INC)/config.h
# 	cp $< $@
# $(INC)/%.h: $(REF)/microrl/src/%.h
# 	cp $< $@
