# cfg
ANYFLAGS  = -Iinc -Itmp -std=gnu99
 CFLAGS  += $(ANYFLAGS) -O0 -g3
TCFLAGS  += $(ANYFLAGS)
TLFLAGS  += -Wl,--print-memory-usage
