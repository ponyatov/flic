# doc
LOGO = vscode/$(MODULE).png
.PHONY: doxy
doxy: .doxygen doc/DoxygenLayout.xml $(LOGO)
	rm -rf doc/html ; doxygen $< 1>/dev/null

DOCS += doc/STM32/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf
doc/STM32/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf:
	$(CURL) $@ https://www.st.com/resource/en/user_manual/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf

DOCS += doc/STM32/dm00083249-use-ccm-sram.pdf
doc/STM32/dm00083249-use-ccm-sram.pdf:
	$(CURL) $@ http://www.st.com/web/en/resource/technical/document/application_note/DM00083249.pdf

DOCS += doc/STM32/openocd.pdf
doc/STM32/openocd.pdf:
	$(CURL) $@ https://openocd.org/doc/pdf/openocd.pdf

kolegite = https://kolegite.com/EE_library/standards/ARM_ABI

DOCS += doc/ARM/ARM_BSABI32_23Q3.pdf
doc/ARM/ARM_BSABI32_23Q3.pdf:
	$(CURL) $@ $(kolegite)/bsabi32.pdf

DOCS += doc/ARM/ARM_AAPCS32_23Q3.pdf
doc/ARM/ARM_AAPCS32_23Q3.pdf:
	$(CURL) $@ $(kolegite)/aapcs32.pdf

DOCS += doc/ARM/ARM_CPPABI32_23Q3.pdf
doc/ARM/ARM_CPPABI32_23Q3.pdf:
	$(CURL) $@ $(kolegite)/cppabi32.pdf

DOCS += doc/ARM/ARM_RTABI32_23Q3.pdf
doc/ARM/ARM_RTABI32_23Q3.pdf:
	$(CURL) $@ $(kolegite)/rtabi32.pdf

.PHONY: doc
doc: $(DOCS)
