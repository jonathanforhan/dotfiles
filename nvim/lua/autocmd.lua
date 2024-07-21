vim.api.nvim_create_autocmd("FileType", {
  desc = "2 space tabs",
  pattern = {
    "css",
    "haskell",
    "html",
    "javascript",
    "lua",
    "systemverilog",
    "typescript",
    "typst",
    "verilog",
    "xml"
  },
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight on yank",
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "auto-compile latex",
  pattern = "*.tex",
  command = "silent !pdflatex %:p &>/dev/null"
})
