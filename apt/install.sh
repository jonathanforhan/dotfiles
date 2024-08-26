#!/bin/bash

# installs gui apps and specific cli apps that are not
# compatable with nix

deps=(
    # GUI
    alacritty
    gnome-tweaks
    putty
    timeshift

    # Xilinx
    libtinfo5
    libncurses5
)

sudo apt install -y "${deps[@]}"
