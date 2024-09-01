{ config, pkgs, ... }:

{
  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.dash-to-dock
  ];

  imports = [
    ./modules/alacritty.nix
    ./modules/bash.nix
    ./modules/dconf.nix
    ./modules/git.nix
    ./modules/pylint.nix
  ];

  programs.home-manager.enable = true;
}
