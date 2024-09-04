# Nix Configuration

```sh
mkdir -p ~/.config/nix
git clone https://github.com/jonathanforhan/dotfiles.git ~/.config/nix
cd ~/.config/nix
```

## NixOS

```sh
sudo nixos-rebuild --flake .
home-manager switch --flake . --impure
```

## Other Distro

```sh
sh <(curl -L https://nixos.org/nix/install) --no-daemon
. $HOME/.nix-profile/etc/profile.d/nix.sh
nix run nixpkgs#home-manager -- switch --flake . --impure
```
