vim.keymap.set("n", "<LEADER>h", ":HopWord<CR>", { desc = "Hop Word" })

return {
  "smoka7/hop.nvim",
  version = "*",
  cmd = "HopWord",
  opts = {}
}
