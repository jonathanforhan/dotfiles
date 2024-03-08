vim.api.nvim_create_augroup("AuFormat", { clear = true })
vim.api.nvim_create_augroup("AuFiletype", { clear = true })
vim.api.nvim_create_augroup("AuCompile", { clear = true })
vim.api.nvim_create_augroup("AuUi", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format on Save",
  group = "AuFormat",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})

vim.api.nvim_create_autocmd("BufRead", {
  desc = "Shader Language Filetype Recognition",
  group = "AuFiletype",
  pattern = {
    "*.frag",
    "*.geom",
    "*.glsl",
    "*.tesc",
    "*.vert",
  },
  command = "setlocal ft=glsl"
})

vim.api.nvim_create_autocmd("Filetype", {
  desc = "2 Space Tabs",
  group = "AuFiletype",
  pattern = {
    "css",
    "haskell",
    "html",
    "javascript",
    "lua",
    "typescript",
    "xml",
  },
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})

vim.api.nvim_create_autocmd({ "BufWritePost", "Filetype" }, {
  desc    = "Auto-Compile LaTeX",
  group   = "AuCompile",
  pattern = "*.tex",
  command = "silent !pdflatex %:p &>/dev/null"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc     = "Highlight on Yank",
  group    = "AuUi",
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("Filetype", {
  desc = "Highlight Hex with Color, #BADA55",
  group = "AuUi",
  pattern = {
    "css",
    "html",
    "javascript",
    "lua",
    "typescript",
    "xml",
    "yaml",
  },
  command = "ColorizerAttachToBuffer"
})
