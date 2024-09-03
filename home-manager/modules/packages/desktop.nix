{ pkgs, lib, config, ... }:

{
  options = {
    desktop.enable = lib.mkEnableOption "enable desktop packages";
  };

  config = lib.mkIf config.desktop.enable {
    home.packages = (with pkgs; [
      alacritty
      gnome.gnome-tweaks
      gnomeExtensions.dash-to-dock
      pinentry-gnome3
      timeshift
    ]);
  };
}
