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
      lazygit
      neofetch
      nerdfonts
      pass
      ripgrep
      texliveFull
      tmux
      tree
      unzip
      wget
      xclip
    ]) ++ (with unstable; [
      neovim
    ]);
  };
}
