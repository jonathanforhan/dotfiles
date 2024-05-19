return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      group = ""
    }
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}
