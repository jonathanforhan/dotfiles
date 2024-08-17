#!/bin/bash

#
# Call this once when setting up environment
#

function link  {
    ln -sf "$(dirname `pwd`)/$1" "$HOME/.$1"
}

link bashrc
link bash_aliases
link profile
link inputrc

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
