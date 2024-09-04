{ pkgs, lib, config, ... }:

{
  imports = [
    ./packages/mod.nix
    ./alacritty.nix
    ./bash.nix
    #./dconf.nix (TODO make this a option)
    ./git.nix
    ./pylint.nix
    ./vimrc.nix
  ];
}
