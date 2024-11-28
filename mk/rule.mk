# rule

OBJ += $(patsubst $(SRC)/%.c,$(TMP)/%.o,$(C))

bin/$(MODULE)_$(HW): $(OBJ)
	$(TCC) $(TLFLAGS) -o $@ $^ $(L)

bin/%: ref/%.cpp
	$(CXX) $(CFLAGS) -o $@ $<

$(TMP)/%.o: $(TMP)/%.c $(H)
	$(TCC) $(TCFLAGS) -o $@ -c $<
$(TMP)/%.o: $(SRC)/%.c $(H)
	$(TCC) $(TCFLAGS) -o $@ -c $<

# arch/CortexM
$(TMP)/core_%.o: $(CORE)/Src/%.c $(H)
	$(TCC) $(TCFLAGS) -o $@ -c $<

# parser
# ifeq ($(OS),Linux)
$(TMP)/%.lexer.c: $(SRC)/%.lex
	flex -o $@ $<
$(TMP)/%.lexer.cpp: $(SRC)/%.lex
	flex -o $@ $<
$(TMP)/%.parser.c: $(SRC)/%.yacc
	bison -o $@ $<
$(TMP)/%.parser.cpp: $(SRC)/%.yacc
	bison -o $@ $<
# else
# $(TMP)/%.lexer.c: $(SRC)/%.ragel
# 	echo > $@
# $(TMP)/%.parser.c: $(SRC)/%.ragel
# 	ragel -G2 -o $@ $<
# endif

.PHONY: hex bin
hex: tmp/$(HW)/$(MODULE).hex
%.hex: %.elf
	$(TARGET)-objcopy -O ihex $< $@
bin: tmp/$(HW)/$(MODULE).bin
%.bin: %.elf
	$(TARGET)-objcopy -O binary $< $@
