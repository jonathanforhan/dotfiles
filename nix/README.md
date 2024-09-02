# Nix Configuration

```sh
mkdir -p ~/.config/nix
git clone https://github.com/jonathanforhan/dotfiles.git !$
cd !$
```

## NixOS

```sh
sudo nixos-rebuild --flake .
```

## Home-Manager

```sh
home-manager switch --flake . --impure
```
