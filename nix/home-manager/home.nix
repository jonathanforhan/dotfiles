{ config, pkgs, lib, ... }:

let
  config-map = v: {
    name = "${config.xdg.configHome}/${v}";
    value = ({
      source = ./config + "/${v}";
      recursive = true;
    });
  };
  export-config = dirs: (builtins.listToAttrs (map config-map dirs));

  unstable = import (builtins.fetchTarball "channel:nixos-unstable")
  { config = config.nixpkgs.config; };
in {
  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "24.05";
  home.packages = (with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.dash-to-dock
  ]) ++ (with unstable; [
    neovim
  ]);

  imports = [
    ./modules/alacritty.nix
    ./modules/bash.nix
    ./modules/dconf.nix
    ./modules/git.nix
    ./modules/pylint.nix
  ];

  home.file = (export-config [ "nvim" "tmux" "neofetch" ]);

  programs.home-manager.enable = true;
}
