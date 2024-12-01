REF += ref/Espruino/README.md
ref/Espruino/README.md:
	$(GITREF) https://github.com/espruino/Espruino.git $(dir $@)

REF += ref/iskrajs/README.md
ref/iskrajs/README.md:
	$(GITREF) -b iskrajs https://github.com/amperka/Espruino.git $(dir $@)

REF += ref/stm32f4discovery-bsp/README.md
ref/stm32f4discovery-bsp/README.md:
	$(GITREF) https://github.com/STMicroelectronics/stm32f4discovery-bsp.git $(dir $@)
