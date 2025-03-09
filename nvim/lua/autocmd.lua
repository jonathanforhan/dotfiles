vim.api.nvim_create_autocmd("FileType", {
  desc = "2 space tabs",
  pattern = {
    "css",
    "haskell",
    "html",
    "javascript",
    "lua",
    "nix",
    "scheme",
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

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local colors = require("tokyonight.colors").setup()
    vim.api.nvim_set_hl(0, "@lsp.typemod.class.constructorOrDestructor", { link = "Function" }) -- Constructors and Destructors are methods
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.purple })                             -- builtin types
    vim.api.nvim_set_hl(0, "@lsp.typemod.type.defaultLibrary", { fg = colors.purple })          -- stdint.h types
    vim.api.nvim_set_hl(0, "@lsp.typemod.type.deduced", { fg = colors.purple })                 -- auto
    vim.api.nvim_set_hl(0, "@lsp.typemod.class.deduced", { fg = colors.purple })                -- auto
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = colors.purple })                       -- namespaces
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.cyan })                        -- brackets
  end,
})

--[[ *not currently used*
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "auto-compile latex",
  pattern = "*.tex",
  command = "silent !pdflatex %:p &>/dev/null"
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "ejs",
  pattern = { "*.ejs" },
  command = "set ft=html"
})
]]
