{ ... }:

{
  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "24.05";

  imports = [
    ./modules/mod.nix
    ./config/mod.nix
  ];

  programs.home-manager.enable = true;
}
