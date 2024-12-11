# install
.PHONY: install update ref gz
install: doc ref gz
	$(MAKE) update
	rustup target add thumbv7em-none-eabihf
	rustup component add rustfmt
update:
	sudo apt update
	sudo apt install -uy `cat apt.$(shell lsb_release -si)` $(APT)
	rustup self update ; rustup update
ref: $(REF)
gz:  $(GZ)
