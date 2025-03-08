return {
  "folke/trouble.nvim",
  opts = {
    keys = {
      ["<esc>"] = "close",
      ["<cr>"] = "jump_close"
    }
  },
  cmd = "Trouble",
  keys = {
    {
      "<LEADER>xx",
      "<CMD>Trouble diagnostics toggle focus=true win.size=0.4<CR>",
      desc = "Diagnostics",
    },
    {
      "<LEADER>xX",
      "<CMD>Trouble diagnostics toggle focus=true win.size=0.4 filer.buf=0<CR>",
      desc = "Buffer Diagnostics",
    },
    {
      "<LEADER>xs",
      "<CMD>Trouble symbols toggle focus=true win={position=right,size=0.4}<CR>",
      desc = "Symbols",
    },
    {
      "<LEADER>xl",
      "<CMD>Trouble lsp toggle focus=true win={position=right,size=0.4}<CR>",
      desc = "LSP Definitions / references",
    }
  }
}
