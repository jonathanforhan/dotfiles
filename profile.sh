#/bin/bash

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
[ -d $HOME/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

tmux new-session -A -D -s main &>/dev/null
