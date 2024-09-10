{ pkgs, lib, config, ... }:

let
  unstable = import (builtins.fetchTarball "channel:nixos-unstable")
  { config = config.nixpkgs.config; };
in {
  options = {
    common.enable = lib.mkEnableOption "enable common packages";
  };

  config = lib.mkIf config.common.enable {
    home.packages = (with pkgs; [
      bear
      cargo
      clang-tools
      cmake
      curl
      go
      julia_19
      lazygit
      lua
      luajitPackages.luarocks-nix
      neofetch
      nerdfonts
      ninja
      nodejs_22
      pass
      perl
      php
      php82Packages.composer
      (python312.withPackages (p: with p; [
        matplotlib
        numpy
        pip
        regex
        venvShellHook
      ]))
      ripgrep
      ruby
      rustc
      texliveFull
      tmux
      tree
      unzip
      wget
      xclip
      zulu17
    ]) ++ (with unstable; [
      neovim
    ]);
  };
}
