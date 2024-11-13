include arch/CortexM.mk

CUBEF4_GZ = STM32CubeF4_$(CUBEF4_VER).zip

GZ += $(CROSS)/$(CUBEF4_GZ)
$(CROSS)/$(CUBEF4_GZ):
	$(CURL) $@ $(CUBEF4_URL)/v$(CUBEF4_VER).zip
