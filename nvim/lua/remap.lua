vim.keymap.set("n", "Q", "<NOP>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<LEADER>p", "<CMD>b#<CR>")

local builtin = require("telescope.builtin")
local function any_dir(fn)
  fn({ search_dirs = { vim.fn.input("Directory: ", "", "file") } })
end

require("which-key").register({
  mode = "n",
  d = { function() require("trouble").toggle() end, "Toggle Diagnostics" },
  f = {
    name = "Files",
    b = { builtin.buffers, "Find Buffers" },
    f = { builtin.find_files, "Find Files" },
    g = { builtin.find_files, "Find Git Files" },
    s = { builtin.live_grep, "Grep" },
    F = { function() any_dir(builtin.find_files) end, "Find Files with Path" },
    S = { function() any_dir(builtin.live_grep) end, "Grep with Path" }
  },
  g = {
    name = "Git",
    p = { "<CMD>GitGutterPreviewHunk<CR>", "Preview Hunk" },
    u = { "<CMD>GitGutterUndoHunk<CR>", "Undo Hunk" },
    d = { "<CMD>GitGutterDiffOrig", "Diff" }
  },
  h = { "<CMD>HopWord<CR>", "Hop Word" },
  l = {
    name = "LSP",
    a = { vim.lsp.buf.code_action, "Code Action" },
    r = { vim.lsp.buf.rename, "Rename" }
  },
  p = "which_key_ignore",
  x = {
    name = "C++",
    h = { "<CMD>ClangdSwitchSourceHeader<CR>", "Switch Source-Header" },
    m = { "<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>", "Define Method" },
    M = { "<CMD>TSCppDefineClassFunc<CR>", "Define Method Inline" }
  }
}, { prefix = "<LEADER>" })

require("which-key").register({
  mode = "v",
  x = {
    name = "C++",
    m = { "<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>", "Define Method" },
    M = { "<CMD>TSCppDefineClassFunc<CR>", "Define Method Inline" }
  }
}, { prefix = "<LEADER>" })
