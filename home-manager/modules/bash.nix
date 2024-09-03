{ ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "ignoredups" "ignorespace" ];
    historyIgnore = [ "ls" "l" "cd" ];
    bashrcExtra = ''
      shopt -s histappend
      shopt -s checkwinsize
      PS1='$ '
      export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
      set mode vi
    '';
    shellAliases = {
      "grep" = "grep --color=auto";
      "fgrep" = "fgrep --color=auto";
      "egrep" = "egrep --color=auto";
      "ls" = "ls --color=auto";
      "ll" = "ls -al";
      "la" = "ls -A";
      "l" = "ls -l";
      "vim" = "nvim";
      "vi" = "vim";
      "gitui" = "lazygit";
    };
    sessionVariables = {
      GPG_TTY = "$(tty)";
      GCM_CREDENTIAL_STORE = "gpg";
      EDITOR = "nvim";
    };
  };

  home.file.".inputrc" = {
    enable = true;
    text = ''
      set editing-mode vi

      $if mode=vi
          set keymap vi-command
          Control-l: clear-screen

          set keymap vi-insert
          Control-l: clear-screen
      $endif
    '';
  };
}