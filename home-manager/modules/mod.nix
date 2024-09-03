{ pkgs, lib, config, ... }:

{
  imports = [
    ./packages/mod.nix
    ./alacritty.nix
    ./bash.nix
    ./dconf.nix
    ./git.nix
    ./pylint.nix
    ./vimrc.nix
  ];
}
