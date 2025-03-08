#!/bin/bash

# setup profile
ln -sf "$HOME/.config/bashrc.sh"     "$HOME/.bashrc"
ln -sf "$HOME/.config/profile.sh"    "$HOME/.profile"
ln -sf "$HOME/.config/inputrc"       "$HOME/.inputrc"
ln -sf "$HOME/.config/.clang-format" "$HOME/.clang-format"

# update repos
sudo apt update

# install dependencies
sudo apt install -y\
	build-essential\
	cmake\
	curl\
	gettext\
	git\
	luarocks\
	neofetch\
	ninja-build\
	pass\
	ripgrep\
	tmux\
	tree\
	unzip\
	wget\
	xclip\
    python3.12-venv

# install or update nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
