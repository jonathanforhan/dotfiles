return {
  "Badhi/nvim-treesitter-cpp-tools",
  ft = "cpp",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function(_, opts)
    opts = {
      preview = {
        quit = "q",
        accept = "<CR>"
      },
      header_extension = "hpp",
      source_extension = "cpp"
    }

    require("nt-cpp-tools").setup(opts)

    local switch_source_header = ":ClangdSwitchSourceHeader<CR>"
    local define_method = ":TSCppDefineClassFunc<CR>"

    vim.keymap.set("n", "<LEADER>xh", switch_source_header, { desc = "Switch Source-Header" })
    vim.keymap.set("n", "<C-k><C-o>", switch_source_header, { desc = "Switch Source-Header" })
    vim.keymap.set({ "n", "v" }, "<LEADER>xm", define_method .. switch_source_header, { desc = "Define Method" })
    vim.keymap.set({ "n", "v" }, "<LEADER>xM", define_method, { desc = "Define Method Inline" })
  end
}
