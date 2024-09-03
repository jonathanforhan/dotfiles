{ pkgs, lib, config, ... }:

let
  config-map = v: {
    name = "${config.xdg.configHome}/${v}";
    value = ({
      source = ./. + "/${v}";
      recursive = true;
    });
  };
  export-config = dirs: (builtins.listToAttrs (map config-map dirs));
in {
  home.file = (export-config [ "nvim" "tmux" "neofetch" ]);
}
