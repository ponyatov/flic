# check CubeMX BSP builds ok
.PHONY: bsp
bsp:
	cmake -S $(CWD)/hw/$(HW) -B $(TMP)/bsp/$(HW)
	cmake --build $(TMP)/bsp/$(HW)

CM += CMake* cmake/* cpu/*.cmake arch/*.cmake

.PHONY: cmake
cmake: $(ELF)
$(ELF): $(CM)
	cmake        -B $(TMP)/$(HW) -S $(CWD) --preset $(HW)
	cmake   --build $(TMP)/$(HW)
	cmake --install $(TMP)/$(HW)
