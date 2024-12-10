# cross
HW ?= netduinoplus2

# HWINFO = tmp/hw.info

# ifeq (,$(wildcard $(HWINFO)))
# .PHONY: hwinfo
# hwinfo: $(HWINFO)
# DESCR = $(firstword $(subst /, ,$(shell st-info --descr)))
# $(HWINFO):
# 	echo "STVER  ?= $(shell st-info --version)"  > $@
# 	echo "FLASH  ?= $(shell st-info --flash  )" >> $@
# 	echo "SRAM   ?= $(shell st-info --sram   )" >> $@
# 	echo "SERIAL ?= $(shell st-info --serial )" >> $@
# 	echo "CHIPID ?= $(shell st-info --chipid )" >> $@
# 	echo "DESCR  ?= $(DESCR)"                   >> $@
# else

# ifneq ($(HW),_)
# include      $(HWINFO)
# include   hw/$(DESCR)_$(CHIPID).mk
# endif
ifneq ($(HW)_,_)
include   hw/$(HW).mk
include  cpu/$(CPU).mk
include arch/$(ARCH).mk
include   os/$(OS).mk
endif

# cross-compiler
TAS   = $(TARGET)-gcc
TCC   = $(TARGET)-gcc
TXX   = $(TARGET)-g++
TLD   = $(TARGET)-gcc
TDUMP = $(TARGET)-objdump
TSIZE = $(TARGET)-size
TCOPY = $(TARGET)-objcopy

# cfg
TAFLAGS = -g3
TOPT    = -O0
TCFLAGS = $(TAFLAGS) $(TOPT) -std=gnu11
TXFLAGS = $(TAFLAGS) $(TOPT) -std=gnu++17
LDS     = $(CWD)/hw/$(HW)/$(CPU)Tx_FLASH.ld
