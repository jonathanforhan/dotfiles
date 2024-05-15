local prefixed = {
  mode = "n",
  prefix = "<LEADER>",
  d = { name = "Debugger" },
  f = { name = "Files" },
  g = { name = "Git" },
  l = { name = "LSP" },
  p = { ":b#<CR>", "Previous Buffer" },
  u = { ":Lazy update<CR>:MasonUpdate<CR>:TSUpdate<CR>", "Update" },
  x = { name = "C++" }
}

local normal = {
  mode = "n",
  ["<C-h>"] = { "<C-w>h", "Window Left" },
  ["<C-j>"] = { "<C-w>j", "Window Down" },
  ["<C-k>"] = { "<C-w>k", "Window Up" },
  ["<C-l>"] = { "<C-w>l", "Window Right" },
  Q = { "<NOP>" }
}

local visual = {
  mode = "v",
  s = { ":sort<CR>", "Sort Alphabetically" },
  x = { name = "C++" }
}

require("which-key").register(prefixed)
require("which-key").register(normal)
require("which-key").register(visual)
