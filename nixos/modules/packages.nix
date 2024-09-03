{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = (with pkgs; [
    alacritty
    bear
    blender
    cargo
    clang
    clang-tools
    cmake
    curl
    gcc
    gitFull
    git-credential-manager
    gnumake
    gnupg
    go
    home-manager
    julia_19
    lazygit
    lshw
    lua
    luajitPackages.luarocks-nix
    neofetch
    nerdfonts
    ninja
    nodejs_22
    pass
    pciutils
    perl
    php
    php82Packages.composer
    pinentry-gnome3
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
