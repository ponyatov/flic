# format
.PHONY: format
format: tmp/format_cpp tmp/format_js tmp/format_rs
tmp/format_cpp: $(C) $(H) ref/crlf.cpp
	$(CF) $? && touch $@
tmp/format_js: $(J)
	$(CF) $? && touch $@
