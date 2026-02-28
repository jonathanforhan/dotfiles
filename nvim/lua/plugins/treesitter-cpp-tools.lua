return {
  "Badhi/nvim-treesitter-cpp-tools",
  ft = "cpp",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "p00f/clangd_extensions.nvim",
      config = function()
        require("clangd_extensions").setup()
      end
    }
  },
  opts = {
    preview = {
      quit = "q",
      accept = "<CR>"
    },
    header_extension = "hpp",
    source_extension = "cpp"
  },
  config = function(_, opts)
    require("nt-cpp-tools").setup(opts)

    local switch_source_header = ":ClangdSwitchSourceHeader<CR>"
    local define_method = ":TSCppDefineClassFunc<CR>"

    vim.keymap.set("n", "<C-k><C-o>", switch_source_header, { desc = "Switch Source-Header" })
    vim.keymap.set("v", "<LEADER>xm", define_method .. switch_source_header, { desc = "Define Method" })
    vim.keymap.set("v", "<LEADER>xM", define_method, { desc = "Define Method Inline" })
  end
}
