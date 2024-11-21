# doc
LOGO = vscode/$(MODULE).png
.PHONY: doxy
doxy: .doxygen doc/DoxygenLayout.xml $(LOGO)
	rm -rf doc/html ; doxygen $< 1>/dev/null

DOCS += doc/STM32/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf
doc/STM32/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf:
	$(CURL) $@ https://www.st.com/resource/en/user_manual/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf

DOCS += doc/STM32/openocd.pdf
doc/STM32/openocd.pdf:
	$(CURL) $@ https://openocd.org/doc/pdf/openocd.pdf

.PHONY: doc
doc: $(DOCS)
