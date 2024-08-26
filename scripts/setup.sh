#!/bin/bash

#
# Call this once when setting up environment
#

# may should errors, that's fine
sh <(curl -L https://nixos.org/nix/install) --no-daemon
nix run home-manager/master -- init --switch
$HOME/.config/nix/build.sh
$HOME/.config/apt/install.sh

wget "https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.5.0/gcm-linux_amd64.2.5.0.deb" -O /tmp/gcmcore.deb
sudo dpkg -i /tmp/gcmcore.deb
git-credential-manager configure
git config --global credential.helper manager

function link  {
    ln -sf "$HOME/.config/$1" "$HOME/.$1"
}

link bashrc
link bash_aliases
link profile
link inputrc

ln -sf "$HOME/.config/scripts/enc" "$HOME/.local/bin/enc"
ln -sf "$HOME/.config/nix/build.sh" "$HOME/.local/bin/pkg-switch"
ln -sf "$HOME/.config/nix/home-manager/home.nix" "$HOME/packages.nix" 

mkdir -p $HOME/.config/autostart

echo \
'[Desktop Entry]
Type=Application
Exec=/home/jon/.config/scripts/startup.sh &>/dev/null
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=startup
Name=startup
Comment[en_US]=runs once
Comment=runs once' > $HOME/.config/autostart/startup.desktop
