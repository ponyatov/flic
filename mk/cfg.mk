# cfg
CFLAGS  = -Iinc -Itmp -O0 -g3
TCFLAGS  += $(CFLAGS)
TLFLAGS  += -Wl,--print-memory-usage
