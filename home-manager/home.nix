{ config, pkgs, ... }:

{
  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "24.05";
  #home.packages = with pkgs; [];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  imports = [
    ./modules/alacritty.nix
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/pylint.nix
  ];

  programs.home-manager.enable = true;
}
