{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = (with pkgs; [
    alacritty
    cargo
    clang
    cmake
    curl
    gcc
    gitFull
    git-credential-manager
    gnupg
    go
    home-manager
    julia_19
    lazygit
    lshw
    lua
    luajitPackages.luarocks-nix
    gnumake
    neofetch
    nerdfonts
    ninja
    nodejs_22
    pass
    pciutils
    perl
    php
    php82Packages.composer
    pinentry-curses
    (python312.withPackages (p: with p; [
      regex
      pip
      venvShellHook
    ]))
    ripgrep
    ruby
    rustc
    timeshift
    tmux
    tree
    unzip
    vim
    wget
    xclip
    zulu17
  ]);

  environment.gnome.excludePackages = (with pkgs; [
    gnome-connections
    gnome-tour
    xterm
  ]) ++ (with pkgs.gnome; [
    epiphany
    geary
  ]);
}
