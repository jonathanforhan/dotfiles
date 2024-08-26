{ config, pkgs, ... }:

let
  unstable = import (builtins.fetchTarball "channel:nixos-unstable")
  { config = config.nixpkgs.config; };
in {
  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    # do not put gui apps here
    # this is just for cli configuration
    cargo
    cmake
    git
    gnupg
    go
    gpg-tui
    julia_19
    lazygit
    lua
    luajitPackages.luarocks-nix
    neofetch
    ninja
    nodejs_22
    pass
    perl
    php
    php82Packages.composer
    (python312.withPackages (p: with p; [
      regex
      pip
      venvShellHook
    ]))
    redshift
    ripgrep
    ruby
    rustc
    tmux
    tree
    unstable.neovim
    vim
    zulu17
  ];

  programs.home-manager.enable = true;
}
