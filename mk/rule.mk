# rule

OBJ += $(patsubst $(SRC)/%.c,$(TMP)/%.o,$(C))

bin/$(MODULE)_$(HW): $(OBJ)
	$(TCC) $(TLFLAGS) -o $@ $^ $(L)

$(TMP)/%.o: $(TMP)/%.c $(H)
	$(TCC) $(TCFLAGS) -o $@ -c $<
$(TMP)/%.o: $(SRC)/%.c $(H)
	$(TCC) $(TCFLAGS) -o $@ -c $<

# arch/CortexM
$(TMP)/core_%.o: $(CORE)/Src/%.c $(H)
	$(TCC) $(TCFLAGS) -o $@ -c $<

# parser
ifeq ($(OS),Linux)
$(TMP)/%.lexer.c: $(SRC)/%.lex
	flex -o $@ $<
$(TMP)/%.parser.c: $(SRC)/%.yacc
	bison -o $@ $<
endif

$(TMP)/%.c: $(SRC)/%.ragel
	ragel -G2 -o $@ $<

%.hex: %.elf
	$(TARGET)-objcopy -O ihex $< $@
%.bin: %.elf
	$(TARGET)-objcopy -O binary $< $@
