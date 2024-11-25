HW  = STM32F407VGT

.PHONY: autopatch
autopatch:
	$(MAKE) fix

LDS = $(HW)x_FLASH.ld
FIX += $(LDS).fix
$(LDS).fix: $(LDS)
	dos2unix $< *-$(LDS).patch
	patch $< 0001-$(LDS).patch
	patch $< 0002-$(LDS).patch
	patch $< 0003-$(LDS).patch
	patch $< 0004-$(LDS).patch
	patch $< 0005-$(LDS).patch
	patch $< 0006-$(LDS).patch
	patch $< 0007-$(LDS).patch
	patch $< 0008-$(LDS).patch
	cp $< $@

STARTUP = startup_stm32f407xx.s
FIX += $(STARTUP).fix
$(STARTUP).fix: $(STARTUP)
	dos2unix $< *-$(STARTUP).patch
	patch $< 0000-$(STARTUP).patch
	cp $< $@

.PHONY: fix
fix: $(FIX)
