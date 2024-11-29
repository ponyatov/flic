CPU  = STM32L496AGI

.PHONY: autopatch
autopatch:
	$(MAKE) fix

LDS = $(CPU)x_FLASH.ld
FIX += $(LDS).fix
$(LDS).fix: $(LDS)
	dos2unix $< *-$(LDS).patch
	patch $< 0000-$(LDS).patch
	cp $< $@

STARTUP = startup_stm32f407xx.s
FIX += $(STARTUP).fix
$(STARTUP).fix: $(STARTUP)
	dos2unix $< *-$(STARTUP).patch
	patch $< 0000-$(STARTUP).patch
	cp $< $@

.PHONY: fix
fix: $(FIX)
