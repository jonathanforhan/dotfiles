return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add          = { text = "+" },
      change       = { text = "~" },
      delete       = { text = "-" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" }
    },
    signs_staged = {
      add          = { text = "+" },
      change       = { text = "~" },
      delete       = { text = "-" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" }
    },
    current_line_blame_opts = { delay = 250 }
  },
  config = function(_, opts)
    local gitsigns = require("gitsigns")

    gitsigns.setup(opts)

    vim.keymap.set("n", "<LEADER>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
    vim.keymap.set("n", "<LEADER>gu", gitsigns.reset_hunk, { desc = "Undo Hunk" })
    vim.keymap.set("n", "<LEADER>gd", gitsigns.diffthis, { desc = "Diff" })
    vim.keymap.set("n", "<LEADER>gb", gitsigns.toggle_current_line_blame, { desc = "Blame" })
  end
}
