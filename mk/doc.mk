# doc
.PHONY: doxy
doxy: .doxygen vscode/$(MODULE).png doc/DoxygenLayout.xml
	rm -rf docs ; doxygen $< 1>/dev/null

.PHONY: doc
doc:
