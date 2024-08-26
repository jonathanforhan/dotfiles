#!/usr/bin/bash

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# go
[ -d "/usr/local/go/bin" ] && export PATH="$PATH:/usr/local/go/bin"
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"

# haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gpg
export GPG_TTY=$(tty)
export GCM_CREDENTIAL_STORE=gpg

# nvim
export EDITOR=nvim

# Xilinx
[ -f /tools/Xilinx/Vivado/2023.2/settings64.sh ] && . /tools/Xilinx/Vivado/2023.2/settings64.sh

# Petalinux
[ -d "/tools/petalinux/tools/common/petalinux/bin" ] && export PATH="$PATH:/tools/petalinux/tools/common/petalinux/bin" && export PETALINUX='/tools/petalinux'

## uncomment if using wsl
# /usr/bin/tmux new-session -A -D -s main &>/dev/null
if [ -e /home/jon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
