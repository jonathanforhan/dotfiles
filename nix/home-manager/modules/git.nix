{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Jonathan Forhan";
    userEmail = "jonathan.forhan@gmail.com";
    extraConfig.credential.helper = "manager";
  };
}
