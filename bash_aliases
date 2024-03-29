#!/usr/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -al'
alias la='ls -A'
alias l='ls -l'

alias vim='nvim'
alias python='python3'
alias chrome='flatpak run com.google.Chrome'

alias open='xdg-open'
alias gitui='lazygit'
