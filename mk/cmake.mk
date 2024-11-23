HW ?= STM32L496G-DISCO

# check CubeMX BSP builds ok
.PHONY: bsp
bsp:
	cmake -S $(CWD)/hw/$(HW) -B $(TMP)/bsp/$(HW)
	cmake --build $(TMP)/bsp/$(HW)
