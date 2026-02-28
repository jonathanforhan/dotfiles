return {
  "Badhi/nvim-treesitter-cpp-tools",
  ft = { "c", "cpp" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    preview = {
      quit = "q",
      accept = "<CR>"
    },
    header_extension = { "h", "hpp" },
    source_extension = { "c", "cpp" }
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
