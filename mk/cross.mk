# cross
HWINFO = tmp/hw.info
ifneq (,$(wildcard $(HWINFO)))
	include  $(HWINFO)
	ifneq (,$(DESCR))
	include   hw/$(DESCR)_$(CHIPID).mk
	include   hw/$(HW).mk
	include  cpu/$(CPU).mk
	include arch/$(ARCH).mk
	endif
else
.PHONY: info
info: $(HWINFO)
$(HWINFO):
	echo "STVER  ?= $(shell st-info --version)"  > $@
	echo "FLASH  ?= $(shell st-info --flash  )" >> $@
	echo "SRAM   ?= $(shell st-info --sram   )" >> $@
	echo "SERIAL ?= $(shell st-info --serial )" >> $@
	echo "CHIPID ?= $(shell st-info --chipid )" >> $@
	echo "DESCR  ?= $(shell st-info --descr  )" >> $@
endif
