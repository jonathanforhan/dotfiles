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
      cargo
      curl
      gcc
      git-credential-manager
      gnumake
      lazygit
      neofetch
      nerdfonts
      nodejs_22
      pandoc
      pass
      (python312.withPackages (p: with p; [
        numpy
        matplotlib
      ]))
      ripgrep
      texliveFull
      tmux
      tree
      unzip
      wget
      xclip

      # lsp
      clang-tools
      cmake-language-server
      ltex-ls
      lua-language-server
      pyright
    ]) ++ (with unstable; [
      neovim
    ]);
  };
}
