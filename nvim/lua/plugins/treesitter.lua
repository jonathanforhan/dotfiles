return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "comment",
      "cpp",
      "css",
      "go",
      "haskell",
      "html",
      "javascript",
      "lua",
      "python",
      "rust",
      "typescript",
      "vim",
      "vimdoc"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = { enable = true }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
