HW  = STM32F407VGT
LDS = $(HW)x_FLASH.ld
$(LDS).fix: $(LDS)
	dos2unix $< *.patch
	patch $< 0001-$(LDS).patch
	patch $< 0002-$(LDS).patch
	patch $< 0003-$(LDS).patch
	patch $< 0004-$(LDS).patch
	patch $< 0005-$(LDS).patch
	patch $< 0006-$(LDS).patch
	patch $< 0007-$(LDS).patch
	patch $< 0008-$(LDS).patch
	cp $< $@
