REF += ref/Espruino/README.md
ref/Espruino/README.md:
	$(GITREF) https://github.com/espruino/Espruino.git $(dir $@)
