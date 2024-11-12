.PHONY: ref
ref:

ref/microrl/README:
	$(GITREF) -b master https://github.com/Helius/microrl.git $(dir $@)
