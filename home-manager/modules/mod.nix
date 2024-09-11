{ pkgs, lib, config, ... }:

{
  imports = [
    ./packages/mod.nix
    ./alacritty.nix
    ./bash.nix
    ./git.nix
    ./pylint.nix
    ./vimrc.nix
  ];
}
