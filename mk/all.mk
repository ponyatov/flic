.PHONY: all run host
all: bin/$(MODULE)_$(HW) $(F)
run: bin/$(MODULE)_$(HW) $(F)
	$^
host:
	$(shell HW=_ make run)

.PHONY: check
check: bin/crlf
	$< bin/crlf.cpp
