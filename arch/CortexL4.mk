include arch/CortexM.mk

CUBEL4_GZ = STM32CubeL4_$(CUBEL4_VER).zip

GZ += $(CROSS)/$(CUBEL4_GZ)
$(CROSS)/$(CUBEL4_GZ):
	$(CURL) $@ $(CUBEL4_URL)/v$(CUBEL4_VER).zip
