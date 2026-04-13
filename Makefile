# Variables
CONFIG_DIR = $(HOME)/.config/nvim

.PHONY: install uninstall

install:
	@echo "Installing vim plug..."
	curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	@echo "Installing ML4W nvim configuration..."
	mkdir -p $(CONFIG_DIR)
	
	# Install libraries (read-only)
	install -m 777 nvim/* $(CONFIG_DIR)/

	@echo "Installing vim plugins..."
	nvim --headless +PlugInstall +qall

	@echo "Installing YouCompleteMe plugin..."
	cd $(HOME)/.local/share/nvim/plugged/YouCompleteMe && python3 install.py --all
	1

	@echo "Done!"

uninstall:
	rm -rf $(CONFIG_DIR)
	@echo "Removed ML4W nvim configuration."
