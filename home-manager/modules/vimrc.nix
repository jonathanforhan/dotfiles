{ ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set termguicolors
      set number
      set relativenumber
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set expandtab
      set smartindent
      set nowrap
      set nohlsearch
      set incsearch
      set scrolloff=8
      set signcolumn=auto
      set updatetime=50
      set clipboard=unnamedplus
    '';
  };
}
