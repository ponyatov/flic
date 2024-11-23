# debug

REF += $(SWD)/README.md
$(SWD)/README.md:
	$(GITREF) https://github.com/ponyatov/cmsis-svd-stm32.git $(dir $@)
