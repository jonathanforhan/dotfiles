return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      group = ""
    }
  },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local prefixed = {
      mode = "n",
      { "<LEADER>d", group = "Debugger" },
      { "<LEADER>f", group = "Files" },
      { "<LEADER>g", group = "Git" },
      { "<LEADER>l", group = "LSP" },
      { "<LEADER>p", "<CMD>b#<CR>",                           desc = "Previous Buffer" },
      { "<LEADER>u", "<CMD>Lazy update<CR><CMD>TSUpdate<CR>", desc = "Update" },
      { "<LEADER>x", group = "Trouble" }
    }

    local normal = {
      mode = "n",
      { "<C-h>", "<C-w>h",      desc = "Window Left" },
      { "<C-j>", "<C-w>j",      desc = "Window Down" },
      { "<C-k>", "<C-w>k",      desc = "Window Up" },
      { "<C-l>", "<C-w>l",      desc = "Window Right" },
      { "Q",     desc = "<NOP>" }
    }

    local visual = {
      mode = "v",
      { "<LEADER>s", "<CMD>sort<CR>", desc = "Sort Alphabetically" },
      { "<LEADER>x", group = "C++" }
    }

    local which_key = require("which-key")

    which_key.add(prefixed)
    which_key.add(normal)
    which_key.add(visual)
  end
}
