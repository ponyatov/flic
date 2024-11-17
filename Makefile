include mk/var.mk
include mk/version.mk
include mk/cross.mk
include mk/dirs.mk
include mk/tool.mk
include mk/src.mk
include mk/package.mk
include mk/cfg.mk
include mk/all.mk
include mk/format.mk
include mk/rule.mk
include mk/doc.mk
include mk/ref.mk
include mk/install.mk
include mk/merge.mk

.PHONY: disco
disco:
	rm -rf $(TMP)/$(HW)
	$(CMAKE) -DCMAKE_VERBOSE_MAKEFILE=ON \
		-S$(CWD) -B$(TMP)/$(HW) --preset=$(HW)
	$(CMAKE) --build $(TMP)/$(HW)

.PHONY: gdb
gdb: $(TMP)/$(HW)/$(MODULE).elf
	st-util --listen_port 12345 &
	gdb-multiarch -q -x .gdbinit tmp/STM32F407G-DISC1/hello.elf
