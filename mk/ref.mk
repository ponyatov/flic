REF += ref/microrl/README
ref/microrl/README:
	$(GITREF) -b master https://github.com/Helius/microrl.git $(dir $@)

REF += $(GZ)/$(CUBEMX_GZ)
$(GZ)/$(CUBEMX_GZ):
	$(CURL) $@ $(CUBEMX_URL)/$(CUBEMX_GZ)

.PHONY: ref
ref: $(REF)
