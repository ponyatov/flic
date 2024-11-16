.PHONY: all run
all: bin/$(MODULE)_$(HW) $(F)
run: bin/$(MODULE)_$(HW) $(F)
	$^

.PHONY: cpp
cpp:
	$(shell HW=_ make run)
