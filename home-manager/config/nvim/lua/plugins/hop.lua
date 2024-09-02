return {
  "smoka7/hop.nvim",
  version = "*",
  cmd = "HopWord",
  init = function()
    vim.keymap.set("n", "<LEADER>h", ":HopWord<CR>", { desc = "Hop Word" })
  end,
  config = true
}
