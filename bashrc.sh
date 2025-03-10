#!/bin/bash

# History control
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE="ls:l:ll:cd"

# PS1 and color settings
PS1='$ '
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
set mode vi

unset WAYLAND_DISPLAY

# Aliases
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -al"
alias la="ls -A"
alias l="ls -l"
alias vim="nvim"
alias gitui="lazygit"
alias xp="explorer.exe"
alias clip="clip.exe"
alias paste="powershell.exe Get-Clipboard"
alias python="python3"
alias pip="pip3"

# Environment variables
export GPG_TTY=$(tty)
export GCM_CREDENTIAL_STORE=gpg
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
