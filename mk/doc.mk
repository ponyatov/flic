# doc
.PHONY: doc
doc: \
	doc/STM32/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf

.PHONY: doxy
doxy: .doxygen vscode/$(MODULE).png doc/DoxygenLayout.xml
	rm -rf docs ; doxygen $< 1>/dev/null

doc/STM32/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf:
	$(CURL) $@ https://www.st.com/resource/en/user_manual/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf
