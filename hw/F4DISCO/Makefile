#!/usr/bin/make -f

CPU = STM32F407VG

.PHONY: fix
fix:
	dos2unix *
	patch -Nu $(CPU)Tx_FLASH.ld $(CPU)Tx_FLASH.ld.patch
