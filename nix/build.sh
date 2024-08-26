#!/bin/bash
nix run nixpkgs#home-manager -- switch --flake $HOME/.config/nix/#$USER --impure
