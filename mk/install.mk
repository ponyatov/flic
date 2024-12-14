# install
.PHONY: install update ref gz
install: doc ref gz
	$(MAKE) update
	rustup target add thumbv7em-none-eabihf
	rustup component add rustfmt rust-analyzer llvm-tools
	cargo install cargo-binutils
	$(MAKE) $(HOME)/.cargo/bin/probe-rs
update:
	sudo apt update
	sudo apt install -uy `cat apt.$(shell lsb_release -si)` $(APT)
	rustup self update ; rustup update
ref: $(REF)
gz:  $(GZ)

$(HOME)/.cargo/bin/probe-rs:
	curl --proto '=https' --tlsv1.2 -LsSf https://github.com/probe-rs/probe-rs/releases/latest/download/probe-rs-tools-installer.sh | sh
