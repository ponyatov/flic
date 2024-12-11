# format
.PHONY: format
format: tmp/format_rs
tmp/format_cpp: $(C) $(H) $(CX)
	$(CF) $? && touch $@
tmp/format_js: $(J)
	$(CF) $? && touch $@
