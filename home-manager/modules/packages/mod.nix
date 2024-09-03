{ pkgs, lib, config, ... }:

let
  is-nixos = (builtins.pathExists "/etc/NIXOS");
in {
  imports = [
    ./common.nix
    ./desktop.nix
  ];

  common.enable = lib.mkDefault true;
  desktop.enable = lib.mkDefault is-nixos;
}

