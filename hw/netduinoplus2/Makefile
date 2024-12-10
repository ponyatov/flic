#!/usr/bin/make -f

CPU = STM32F405RG
LDS = $(CPU)Tx_FLASH.ld
FIX = $(LDS).fix

$(FIX): $(LDS)
	dos2unix *
	patch $< $(LDS).patch
	touch $@
