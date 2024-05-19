return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {},
  init = function()
    vim.keymap.set("n", "<LEADER>h", ":HopWord<CR>", { desc = "Hop Word" })
  end
}
