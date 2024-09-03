{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = (with pkgs; [
    gcc
    gitFull
    git-credential-manager
    gnumake
    gnupg
    home-manager
    lshw
    pciutils
    vim
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
