return {
  {
    "Badhi/nvim-treesitter-cpp-tools",
    ft = "cpp",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      preview = {
        quit = "q",
        accept = "<CR>"
      },
      header_extension = "hpp",
      source_extension = "cpp"
    },
    init = function()
      vim.keymap.set("n", "<LEADER>xh", ":ClangdSwitchSourceHeader<CR>", { desc = "Switch Source-Header" })
      vim.keymap.set(
        { "n", "v" }, "<LEADER>xm", ":TSCppDefineClassFunc<CR>:ClangdSwitchSourceHeader<CR>", { desc = "Define Method" })
      vim.keymap.set({ "n", "v" }, "<LEADER>xM", ":TSCppDefineClassFunc<CR>", { desc = "Define Method Inline" })
    end
  }
}
