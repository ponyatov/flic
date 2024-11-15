.PHONY: all run
all: bin/$(MODULE) $(F)
run: bin/$(MODULE) $(F)
	$^

.PHONY: cpp
cpp:
	$(shell HW=_ make run)
