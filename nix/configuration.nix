# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import (builtins.fetchTarball "channel:nixos-unstable")
  { config = config.nixpkgs.config; };
in {
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ## Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  ## Locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  ## Graphics
  hardware.opengl.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:11:0:0";
    };
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "";
      };
  };

  ## User
  users.users.jon = {
    isNormalUser = true;
    description = "Jonathan Forhan";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    #packages = with pkgs; [];
  };

  ## Services
  services.displayManager.sddm.enable = true;
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "jon";
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  services.openssh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  ## Packages
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = (with pkgs; [
    alacritty
    cargo
    clang
    cmake
    curl
    gcc
    gitFull
    git-credential-manager
    gnupg
    go
    home-manager
    julia_19
    lazygit
    lshw
    lua
    luajitPackages.luarocks-nix
    gnumake
    neofetch
    nerdfonts
    ninja
    nodejs_22
    pass
    pciutils
    perl
    php
    php82Packages.composer
    (python312.withPackages (p: with p; [
      regex
      pip
      venvShellHook
    ]))
    pinentry-qt
    ripgrep
    ruby
    rustc
    timeshift
    tmux
    tree
    unzip
    vim
    wget
    xclip
    zulu17
  ]) ++ (with unstable; [
    neovim
  ]);

  ## Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  ## Firewall
  #networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
