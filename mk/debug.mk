# debug

REF += hw/svd/README.md
hw/svd/README.md:
	$(GITREF) https://github.com/ponyatov/cmsis-svd-stm32.git $(dir $@)
